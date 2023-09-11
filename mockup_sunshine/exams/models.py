from django.db import models
from django.contrib.auth.models import User  # Import Django's User model

class Participant(models.Model):
    name = models.CharField(max_length=40)
    email = models.EmailField()
    address = models.CharField(max_length=100)
    phone = models.CharField(max_length=20)
    education=models.CharField(max_length=30,default="+2")
    university=models.CharField(max_length=50, default="Tribhuvan University")
    dob=models.DateField(default='2000-01-01')
    user = models.ForeignKey(User, on_delete=models.CASCADE)

# Create your models here.
class Testimony(models.Model):
    student_name = models.CharField(max_length=100)
    test_date = models.DateField()
    testimony_text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.student_name

