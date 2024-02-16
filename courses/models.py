from django.db import models
from django.contrib.auth.models import AbstractBaseUser
from .managers import *
from .validators import *


# Create your models here.
class Role(models.Model):
	name = models.CharField(max_length=100, verbose_name='Роль')


class Award(models.Model):
	title = models.CharField(max_length=100, verbose_name='Заголовок')
	desc = models.TextField(verbose_name='Описание', default='')
	photo = models.ImageField(verbose_name='Значок', upload_to='awards_photos', validators=[award_image_validate])

	class Meta:
		verbose_name = 'Достижение'
		verbose_name_plural = 'Достижения'


class CustomUser(AbstractBaseUser):
	username = models.CharField(verbose_name='Имя пользователя', max_length=150, null=False, default=None, unique=True)
	email = models.EmailField(unique=True, null=True, default=None, blank=True)

	is_staff = models.BooleanField(default=False)
	is_superuser = models.BooleanField(default=False)
	is_active = models.BooleanField(default=True)

	name = models.CharField(verbose_name='Имя', max_length=150, null=True, default=None)
	surname = models.CharField(verbose_name='Фамилия', max_length=150, null=True, default=None, blank=True)
	photo = models.ImageField(verbose_name='Фото', upload_to='user_photos', null=True, blank=True)

	role = models.ForeignKey(Role, on_delete=models.SET_NULL, null=True, default=None, blank=True)
	awards = models.ManyToManyField(Award, verbose_name='Достижения', null=True, default=None, blank=True)

	objects = CustomUserManager()
	USERNAME_FIELD = 'username'

	def has_perm(self, perm, obj=None):
		return self.is_superuser

	def has_module_perms(self, app_label):
		return self.is_superuser

	def get_privs(self):
		return [x.id for x in self.accessible_work_types.all()]

	def get_name(self):
		return f'{self.name} {self.surname}'

	class Meta:
		db_table = 'auth_user'
		verbose_name = 'Пользователь'
		verbose_name_plural = 'Пользователи'

	def __str__(self):
		return f'{self.name} {self.surname}'


class CourseCategory(models.Model):
	name = models.CharField(verbose_name='Название', max_length=255, null=False, default=None)

	def __str__(self):
		return self.name

	class Meta:
		verbose_name = 'Категория курса'
		verbose_name_plural = 'Категории курсов'


class Course(models.Model):
	name = models.CharField(verbose_name='Название курса', max_length=255, null=False)
	description = models.TextField(verbose_name='Описание курса', null=False, default=None)

	theme = models.CharField(verbose_name='Тема курса', max_length=100, null=False, default=None)
	category = models.ForeignKey(CourseCategory, on_delete=models.SET_NULL, null=True, verbose_name='Категория')

	authors = models.ManyToManyField(CustomUser, verbose_name='Авторы курса')
	photo = models.ImageField(verbose_name='Превью', upload_to='courses_previews', validators=[course_preview_validate], default=None, null=True)

	def __str__(self):
		return self.name

	def as_json(self):
		return {
			'id': self.id
		}

	class Meta:
		verbose_name = 'Курс'
		verbose_name_plural = 'Курсы'


class Note(models.Model):
	title = models.CharField(verbose_name='Заголовок', max_length=255, null=False, default=None)
	body = models.TextField(verbose_name='Сообщение', null=False, default=None)
	user = models.ForeignKey(CustomUser, on_delete=models.SET_NULL, null=True, verbose_name='Получатель')
	is_read = models.BooleanField(default=False, verbose_name='Прочитано')
	link = models.URLField(verbose_name='Ссылка', null=False, default=None)

	def as_json(self):
		return {
			'title': self.title,
			'link': self.link,
			'body': self.body,
			'id': self.id
		}

	class Meta:
		verbose_name = 'Уведомление'
		verbose_name_plural = 'Уведомления'

