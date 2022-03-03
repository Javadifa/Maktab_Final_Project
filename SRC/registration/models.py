from django.contrib.auth.models import AbstractUser
from django.core.exceptions import ValidationError
from django.db import models
import re


def valid_username(username):
    email_made = re.search('@eml.com$', username)
    if email_made is not None:
        raise ValidationError('Note that you must write the name without a domain')


class User(AbstractUser):
    RECOVERY_CHOICES = (
        ('phone_number', 'Phone'),
        ('email_address', 'Email'),
    )
    GENDER_CHOICES = (
        ('male', 'Male'),
        ('female', 'Female'),
        ('other', 'Other'),
    )
    username = models.CharField('username', validators=[valid_username], max_length=60, unique=True,
                                help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.',
                                error_messages={'unique': "A user with that username already exists.",
                                                })
    # first_name = models.CharField(max_length=30, null=True)
    # last_name = models.CharField(max_length=30, null=True)
    verify = models.CharField(max_length=15, choices=RECOVERY_CHOICES, default='')
    email = models.CharField(unique=True, max_length=60)
    phone_number = models.CharField(max_length=15, unique=True, validators=[], help_text='', error_messages={})
    # password = models.CharField(max_length=64, )
    birthday = models.DateTimeField(null=True, )
    gender = models.CharField(max_length=10, choices=GENDER_CHOICES, blank=True, null=True)
    country = models.CharField(max_length=50, null=True)
    is_active = models.BooleanField(default=False)
    # is_staff = models.BooleanField(default=False)
    #objects = UserManager()
