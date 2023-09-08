from django.db import models

# Create your models here.
class Testimony(models.Model):
    student_name = models.CharField(max_length=100)
    test_date = models.DateField()
    testimony_text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.student_name