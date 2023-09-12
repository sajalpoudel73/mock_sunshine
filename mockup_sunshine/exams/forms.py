from django.contrib.auth.forms import AuthenticationForm,UserCreationForm
from django.forms import BaseFormSet,forms
from django import forms
from django.contrib.auth.models import User
from .models import *

class ParticipantForm(forms.ModelForm):
    class Meta:
        model = Participant
       
        fields = ['name', 'email', 'address', 'phone','education','university','dob']
        

class ChoiceForm(forms.Form):
    choice_text = forms.CharField(max_length=100)
    is_correct = forms.BooleanField(required=False)

class ChoiceFormSet(BaseFormSet):
    def add_fields(self, form, index):
        super().add_fields(form, index)
        form.fields[f'choice_text_{index}'] = forms.CharField(max_length=100)
        form.fields[f'is_correct_{index}'] = forms.BooleanField(required=False)

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

class questionCategoryForm(forms.ModelForm):
    class Meta:
        model = QuestionCategory
        fields=['name']

class questionSetForm(forms.ModelForm):
    class Meta:
        model = QuestionSet
        fields=['name']
class questionForm(forms.ModelForm):
    class Meta:
        model = Question
        fields=['question_set','category','question']

class questionChoiceForm(forms.ModelForm):
    class Meta:
        model = Choice
        fields=['question','choice','is_correct']
class explanationForm(forms.ModelForm):
    class Meta:
        model = Explanation
        fields=['question','choice','text']