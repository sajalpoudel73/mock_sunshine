from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
from django.views import View
from django.urls import reverse_lazy
from .models import Testimony,Participant
from django.shortcuts import get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required,user_passes_test
from .forms import *
from django.contrib.auth.views import LoginView,LogoutView
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
import itertools

# Create your views here.


def is_staff(user):
    return user.is_staff

class index(View):
    def post(self,request):
        pass

    def get(self, request):
        # Get all testimonies
        if request.user.is_authenticated:
            return redirect(dashboard)
        testimonies = Testimony.objects.all()
        message=None
        if request.user.is_authenticated:

            try:
               
                details = Participant.objects.get(user=request.user)
                message = None
            except Participant.DoesNotExist:
                message = "Need More Details"

        context = {
            'tests_taken': 38231,
            'passed': 35634,
            'title': "homepage",
            'testimonies': testimonies,
            'message': message,
        }
        return render(request, "index.html", context)
    
def about(request):
    return render(request,'about.html')

def test_page(request):
    pass
def exam(request):
    pass


class login(LoginView):
    template_name = 'login.html'
    form_class = LoginForm
    success_url = reverse_lazy('dashboard')

class logout(LogoutView):
    next_page = reverse_lazy('index')

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('fill_details')
    else:
        form = RegistrationForm()

    return render(request, 'register.html', {'form': form})


@login_required
def fill_details(request):
    if request.method == "POST":
        form = ParticipantForm(request.POST)
        if form.is_valid():
            
            user = request.user
            email = form.cleaned_data['email']
            if user.email == email:
                
                participant = form.save(commit=False)
                participant.user = user
                participant.save()
                messages.success(request, 'Participant details added successfully.')
                return redirect('index')  # Redirect to a dashboard page or another relevant page
            else:
                messages.error(request, 'User and email do not match.')
        else:
            messages.error(request, 'Form is not valid. Please check the data you entered.')
    else:
       form = ParticipantForm()
    return render(request, 'details.html', {'form': form})

@login_required
def dashboard(request):
    if request.user.is_staff:
        return redirect(admin_dash)
    return render(request,'dashboard.html')


@login_required
@user_passes_test(is_staff)
def admin_dash(request):
    users = User.objects.exclude(is_staff=True, is_superuser=True).count()
    sets= QuestionSet.objects.all().count()
    questions = Question.objects.all().count()
    context={
        'users':users,
        'sets':sets,
        'questions':questions
    }
    return render(request,'admin_dash.html',context)

@login_required
@user_passes_test(is_staff)
def view_users(request):
    staffs = User.objects.filter(is_staff=True).values('id', 'username', 'email')
    users = User.objects.exclude(is_staff=True, is_superuser=True).values('id', 'username', 'email')
    staffs_list = list(staffs)
    users_list = list(users)
    data = {
        'staffs': staffs_list,
        'users': users_list,
    }
    return render(request,'view-users.html', data )

def view_user(request,username):
    return render(request,'view_user.html',{'username':username})

def edit_user(request,username):
    return HttpResponse("Edit User Route")



@login_required
@user_passes_test(is_staff)
def delete_user(request,email):
    if request.method=="POST":
        user_to_delete = get_object_or_404(User, email=email)
        user_to_delete.delete()
        messages.success(request, f"User {user_to_delete.username} has been deleted successfully.")
        return redirect('admin_dash')
    
@login_required
@user_passes_test(is_staff) 
def add_questionset(request):
    if request.method=="POST":
        form=questionSetForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect(view_questionset)
    else:
        form=questionSetForm()
    return render(request,'add_qset.html',{'form':form})

@login_required
@user_passes_test(is_staff)
def add_question(request):
    if request.method=="POST":
        
        form=questionForm(request.POST)
       
        if form.is_valid():
            form.save()
        return redirect(request.META.get('HTTP_REFERER'))
    else:

        form=questionForm(request.POST)
        
        try:
            sets=QuestionSet.objects.all()
            categories=QuestionCategory.objects.all()
        except:
            sets=None
            categories=None
        context={
            'form':form,
            'sets':sets,
            'categories':categories,
        }
        return render(request,'add_question.html',context)
    
@login_required
@user_passes_test(is_staff)
def view_questionset(request):
    sets=QuestionSet.objects.all()
    return render(request,'view_questionset.html',{'sets':sets})

@login_required
@user_passes_test(is_staff)
def view_set(request, set_id):
    question_set = get_object_or_404(QuestionSet, id=set_id)
    questions = Question.objects.filter(question_set=question_set)
   
    for question in questions:
        choices = Choice.objects.filter(question=question)
        explanations = Explanation.objects.filter(question=question, choice__in=choices)
        question.choices_and_explanations = zip(choices, explanations)
    context = {
    'question_set': question_set,
    'questions': questions,
    }

    return render(request, 'view_set.html', context)

@login_required
@user_passes_test(is_staff)
def add_choice(request, question_id):
    question = get_object_or_404(Question, id=question_id)

    if request.method == "POST":
        form = questionChoiceForm(request.POST, question=question)
        if form.is_valid():
            choice = form.save(commit=False)
            choice.question = question
            choice.save()
            return redirect(request.META.get('HTTP_REFERER'))
    else:
        form = questionChoiceForm(question=question,initial={'question': question})
    
    return render(request, 'choices.html', {
        'form': form,
        'question': question,
    })

@login_required
@user_passes_test(is_staff)
def add_explanation(request, question_id):
    question = get_object_or_404(Question, id=question_id)

    if request.method == "POST":
        form = explanationForm(request.POST, question=question)
        if form.is_valid():
            explanation = form.save(commit=False)
            explanation.question = question
            explanation.save()
            return redirect(request.META.get('HTTP_REFERER'))
    else:
        form = explanationForm(question=question,initial={'question': question})
    
    return render(request, 'explanation.html', {
        'form': form,
        'question': question,
    })


@login_required
@user_passes_test(is_staff)
def add_category(request):
    if request.method=="POST":
        form=questionCategoryForm(request.POST)
        if form.is_valid():
            form.save()
        return redirect(view_questionset)
    else:
        form=questionCategoryForm()
    return render(request,'categories.html',{'form':form})

    
