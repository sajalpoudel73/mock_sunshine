from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.views import View
from django.urls import reverse_lazy
from .models import Testimony,Participant
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .forms import LoginForm,RegistrationForm,ParticipantForm
from django.contrib.auth.views import LoginView,LogoutView
from django.contrib.auth.forms import AuthenticationForm

# Create your views here.
class index(View):
    def post(self,request):
        pass

    def get(self, request):
        # Get all testimonies
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
    success_url = reverse_lazy('index')

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