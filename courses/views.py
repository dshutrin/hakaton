from django.shortcuts import render
from django.contrib.auth import authenticate, login as user_login, logout as user_logout
from django.http import HttpResponseRedirect
from .forms import *


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


def logout(request):
	user_logout(request)
	return HttpResponseRedirect('/')


def main_page(request):
	return render(request, 'site/main_page.html', {
		'courses': Course.objects.all()
	})
