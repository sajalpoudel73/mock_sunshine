from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.views import View
from .models import Testimony

# Create your views here.
class index(View):
    def post(self,request):
        pass

    def get(self,request):
        v=Testimony.objects.all()

        context={
            'tests_taken':38231,
            'passed':35634,
            'title':"homepage",
            'testimonies':v
        }
        return render(request,"index.html",context)
def about(request):
    return render(request,'about.html')