from django.urls import path
from . import views

urlpatterns=[
    path('',views.index.as_view(),name="index"),
    path('about',views.about,name='about'),
    path('test_page',views.test_page,name="test_page"),
    path('login',views.login.as_view(),name='login'),
    path('logout',views.logout.as_view(),name='logout'),
    path('register',views.register,name="register"),
    path('fill_details',views.fill_details,name="fill_details"),
    path('dashboard',views.dashboard,name='dashboard'),
    path('myadmin',views.admin_dash,name="admin_dash"),
    path('view-users',views.view_users,name="view-users",),
    path('edit-user/<str:username>',views.edit_user,name='edit-user'),
    path('delete_user/<str:email>', views.delete_user,name='delete-user'),
    path('view-user/<str:username>',views.view_user,name="view-user"),
    path('add_sets',views.add_questionset,name="add_qset"),
    path('add_question',views.add_question,name="add_question"),
    path('view_qsets',views.view_questionset,name="view_questionset"),
    path('view_set/<str:set_id>',views.view_set,name="view_individualset"),
    path('add_choice/<str:question_id>',views.add_choice,name="add_choice"),
    path('add_explanation/<str:question_id>',views.add_explanation,name="add_explanation"),
    path('add_category',views.add_category,name="add_category")

]