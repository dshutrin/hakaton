from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.contrib.auth import authenticate, login as user_login, logout as user_logout
from django.http import HttpResponseRedirect, JsonResponse
from .forms import *
from django.views.decorators.csrf import csrf_exempt
from pprint import pprint


# Create your views here.
def login_view(request):
	if request.method == 'GET':
		return render(request, 'auth/login.html', {
			'form': LoginForm()
		})
	elif request.method == 'POST':
		username = request.POST["username"]
		password = request.POST["password"]
		usr = authenticate(request, username=username, password=password)
		if usr is not None:
			user_login(request, usr)
			return HttpResponseRedirect('/')
		else:
			return render(request, 'auth/login.html', {
				'form': LoginForm(request.POST)
			})


def logout_view(request):
	user_logout(request)
	return HttpResponseRedirect('/')


def main_page(request):
	top_courses = Course.objects.order_by('name')[:3]
	cat_letters = set([x.name[0] for x in CourseCategory.objects.all().order_by('name')])

	cats = []
	for cat in sorted(cat_letters):
		categories = CourseCategory.objects.filter(name__startswith=cat)
		cats.append({'let': cat, 'objects': categories})

	return render(request, 'site/main_page.html', {
		'top_courses': top_courses,
		'courses': Course.objects.all(),
		'cats': cats
	})


@csrf_exempt
def get_user_notes_count(request, uid):
	return JsonResponse({
		'count': Note.objects.filter(user__id=uid, is_read=False).count()
	})


@csrf_exempt
def get_user_notes(request, uid):
	notes = [x.as_json() for x in Note.objects.filter(user__id=uid, is_read=False)]

	return JsonResponse({
		'notes': notes
	})


@csrf_exempt
def mark_note_as_read(request, note_id):
	note = Note.objects.get(id=note_id)
	note.delete()


@login_required
def profile(request, uid):
	return render(request, 'site/profile.html', {
		'my_courses': Course.objects.filter(authors__id=uid),
		#'awards': [Award.objects.get(id=uid)][:5]
	})


@csrf_exempt
def make_course(request):
	if request.method == 'GET':
		return render(request, 'site/make_course.html', {
			'form': CourseForm()
		})
	elif request.method == 'POST':
		# name = request.POST["name"]
		# description = request.POST["description"]
		# theme = request.POST["theme"]
		#category = request.POST["category"]
		#authors = request.POST["authors"]
		#photo = request.POST["photo"]
		form = CourseForm(request.POST, request.FILES)
		form.authors = request.user

		if form.is_valid():
			new_course = form.save()
			new_course.save()

			new_course.authors.add(request.user)
			new_course.save()

			return HttpResponseRedirect(f'/courses/{new_course.id}')
		else:
			return render(request, 'site/make_course.html', {
				'form': CourseForm()
			})


def courses(request, course_id):
	return render(request, 'site/courses.html', {
		'course': Course.objects.filter(id=course_id),
	})


def edit_course(request, course_id):
	return render(request, 'site/edit_course.html', {
		'course': Course.objects.filter(id=course_id),
	})


def pass_course(request, course_id):
	return render(request, 'site/pass_course.html', {
		'course': Course.objects.filter(id=course_id),
	})



