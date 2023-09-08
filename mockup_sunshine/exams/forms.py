from django.contrib.auth.forms import AuthenticationForm,UserCreationForm
from django import forms
from django.contrib.auth.models import User
from .models import Participant

class ParticipantForm(forms.ModelForm):
    class Meta:
        model = Participant
       
        fields = ['name', 'email', 'address', 'phone']
        



class LoginForm(AuthenticationForm):
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))

class RegistrationForm(UserCreationForm):
    username = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        max_length=30,
        required=True,
        help_text='Required. 30 characters or fewer. Letters, digits, and @/./+/-/_ only.',
    )
    password1 = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control'}),
        label='Password',
        help_text='Your password must contain at least 8 characters.',
    )
    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control'}),
        label='Password confirmation',
        help_text='Enter the same password as above, for verification.',
    )
    email = forms.EmailField(
        widget=forms.EmailInput(attrs={'class': 'form-control'}),
        required=True,
        help_text='Enter a valid email address.',
    )

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']