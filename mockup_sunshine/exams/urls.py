from django.urls import path
from . import views

urlpatterns=[
    path('',views.index.as_view(),name="index"),
    path('about',views.about,name='about'),
    path('test_page',views.test_page,name="test_page"),
    path('login',views.login.as_view(),name='login'),
    path('logout',views.logout.as_view(),name='logout'),
    path('register',views.register,name="register"),
    path('fill_details',views.fill_details,name="fill_details")
]