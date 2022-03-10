# Generated by Django 3.2 on 2022-03-10 20:11

import accounts.models
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import mail_page.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Signature',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_send', models.BooleanField(blank=True, default=False, null=True)),
                ('user', models.OneToOneField(max_length=50, on_delete=django.db.models.deletion.PROTECT, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Label',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(blank=True, max_length=30, null=True)),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='label_owner', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'unique_together': {('title', 'owner')},
            },
        ),
        migrations.CreateModel(
            name='Email',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('receiver', models.CharField(blank=True, help_text='username@eml.com', max_length=50, null=True)),
                ('cc', models.CharField(blank=True, max_length=800, null=True)),
                ('bcc', models.CharField(blank=True, max_length=800, null=True)),
                ('subject', models.CharField(blank=True, max_length=100, null=True)),
                ('body', models.TextField(blank=True, null=True)),
                ('file', models.FileField(blank=True, null=True, upload_to='documents/%Y/%m/%d/', validators=[mail_page.models.file_size])),
                ('timestamp', models.DateTimeField(auto_now_add=True, null=True)),
                ('is_draft', models.BooleanField(default=False)),
                ('is_reply', models.BooleanField(default=False)),
                ('is_archived', models.BooleanField(blank=True, default=False, null=True)),
                ('is_trash', models.BooleanField(blank=True, default=False, null=True)),
                ('label', models.ManyToManyField(blank=True, to='mail_page.Label')),
                ('reply', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='remail', to='mail_page.email')),
                ('signature', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='signature', to='mail_page.signature')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='sender', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-timestamp'],
            },
        ),
        migrations.CreateModel(
            name='Contacts',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('email', models.CharField(max_length=60)),
                ('phone_number', models.CharField(blank=True, help_text='The number of characters entered must be at least 12 and at most 13 digits and must start with +.', max_length=13, null=True, validators=[accounts.models.valid_phone_number])),
                ('other_email', models.CharField(blank=True, max_length=60, null=True)),
                ('birth_date', models.DateTimeField(blank=True, null=True)),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='contacts_owner', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
