from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(Testimony)
admin.site.register(Participant)
admin.site.register(QuestionSet)
admin.site.register(Question)
admin.site.register(QuestionCategory)
admin.site.register(Explanation)
admin.site.register(Choice)