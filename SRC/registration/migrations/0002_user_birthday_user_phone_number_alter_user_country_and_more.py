# Generated by Django 4.0.1 on 2022-02-24 18:40

from django.db import migrations, models
import registration.models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='birthday',
            field=models.DateTimeField(null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='phone_number',
            field=models.CharField(default=9987, error_messages={}, max_length=15, unique=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='user',
            name='country',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='email',
            field=models.CharField(max_length=60, unique=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='gender',
            field=models.CharField(blank=True, choices=[('male', 'Male'), ('female', 'Female'), ('other', 'Other')], max_length=10, null=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='username',
            field=models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=60, unique=True, validators=[registration.models.valid_username], verbose_name='username'),
        ),
        migrations.AlterField(
            model_name='user',
            name='verify',
            field=models.CharField(choices=[('phone_number', 'Phone'), ('email_address', 'Email')], default='', max_length=15),
        ),
    ]