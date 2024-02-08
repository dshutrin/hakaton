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
		'count': 10
	})


@csrf_exempt
def get_user_notes(request, uid):
	class Note:
		def __init__(self):
			self.title = 'Hello, i`m title'
			self.link = 'hello, i`m link'

		def as_json(self):
			return {
				'title': self.title,
				'link': self.link
			}

	return JsonResponse({
		'notes': [Note().as_json() for i in range(10)]
	})
