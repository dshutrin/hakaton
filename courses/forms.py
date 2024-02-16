from django import forms
from .models import *


class LoginForm(forms.ModelForm):
	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)
		for visible in self.visible_fields():
			visible.field.widget.attrs['placeholder'] = visible.field.label

	password = forms.CharField(max_length=256, label='Пароль', widget=forms.PasswordInput)

	class Meta:
		model = CustomUser
		fields = ("username", "password")

class CourseForm(forms.ModelForm):
	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)
		for visible in self.visible_fields():
			visible.field.widget.attrs['placeholder'] = visible.field.label

	class Meta:
		model = Course
		fields = ("name", "description", "theme", "category", "photo")
