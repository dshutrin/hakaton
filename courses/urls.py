from django.urls import path
from .views import *


urlpatterns = [
    path('', main_page),
    path('login', login_view),
    path('logout', logout_view),
    path('get_notes/<int:uid>', get_user_notes),
    path('get_notes_count/<int:uid>', get_user_notes_count),
    path('mark_note_as_read/<int:note_id>', mark_note_as_read),
    path('profile/<int:uid>', profile),
    path('make_course', make_course),
    path('courses/<int:course_id>', courses),
    path('edit_course/<int:course_id>', edit_course),
    path('pass_course/<int:course_id', pass_course)
]
