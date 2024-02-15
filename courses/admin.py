from django.contrib import admin
from .models import *


# Register your models here.
@admin.register(CustomUser)
class CustomUserAdmin(admin.ModelAdmin):
	list_display = ('username', 'name', 'surname')


@admin.register(CourseCategory)
class AdminCourseCategory(admin.ModelAdmin):
	list_display = ('name', )


@admin.register(Course)
class AdminCourse(admin.ModelAdmin):
	list_display = ('name', )


@admin.register(Note)
class AdminCourse(admin.ModelAdmin):
	list_display = ('title', 'user', 'link', 'is_read')


@admin.register(Award)
class AdminCourse(admin.ModelAdmin):
	list_display = ('title', )
