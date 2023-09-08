from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.views import View

# Create your views here.
class index(View):
    def post(self,request):
        pass

    def get(self,request):
        context={
            'tests_taken':38231,
            'passed':35634,
            'title':"homepage"
        }
        return render(request,"index.html",context)
