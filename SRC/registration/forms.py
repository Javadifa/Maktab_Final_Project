from django.contrib.auth.forms import UserCreationForm
from django import forms
from .models import User


class RegisterUserForm(UserCreationForm):

    class Meta:
        model = User
        fields = ('username',
                  'first_name',
                  'last_name',
                  'email',
                  'password1',
                  'password2',
                  'gender',
                  'verify',
                  'birthday',
                  'country')
