from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from .forms import RegisterUserForm
from messenger import settings
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages
from django.core.mail import EmailMessage, send_mail
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.utils.encoding import force_bytes, force_str
from django.contrib.auth import authenticate, login, logout
from . tokens import generate_token


def register_user(request):
    if request.method == "POST":
        form = RegisterUserForm(request.POST)
        if form.is_valid():
            form.save()
            # username = form.cleaned_data['username']
            # pass1 = form.cleaned_data['password1']
            user_email = form.cleaned_data['email']
            fname = form.cleaned_data['first_name']

            # email = form.cleaned_data['email']
            # myuser = User.objects.create_user(username, email, pass1)
            # myuser.first_name = first_name
            # myuser.is_active = False
            # myuser.save()
            messages.success(request,
                             "Your Account has been created succesfully!! Please check your email to confirm your email address in order to activate your account.")
            # Welcome Email
            subject = "Welcome to GFG- Django Login!!"
            message = "Hello " + fname + "!! \n" + "Welcome to THE NOOBS website!! \nThank you for visiting our website\n. We have also sent you a confirmation email, please confirm your email address. \n\nThanking You\nJAVADI"
            from_email = settings.EMAIL_HOST_USER
            to_list = [user_email]
            send_mail(subject, message, from_email, to_list, fail_silently=True)

            # Email Address Confirmation Email
            current_site = get_current_site(request)
            email_subject = "Confirm your Email @ GFG - Django Login!!"
            message2 = render_to_string('email_confirmation.html', {

                'name': fname,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(mainUser.pk)),
                'token': generate_token.make_token(mainUser)
            })
            email = EmailMessage(
                email_subject,
                message2,
                settings.EMAIL_HOST_USER,
                [user_email],
            )
            email.fail_silently = True
            email.send()
            return redirect('signin')
    elif request.method == "GET":
        form = RegisterUserForm(request.GET)


def activate(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        myuser = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        myuser = None

    if myuser is not None and generate_token.check_token(myuser, token):
        myuser.is_active = True
        # user.profile.signup_confirmation = True
        myuser.save()
        login(request, myuser)
        # messages.success(request, "Your Account has been activated!!")
        return HttpResponse(request, 'Your Account has been activated!!')
    else:
        return HttpResponse(request, 'registration failed')


def signin(request):
    if request.method == 'POST':
        username = request.POST['username']
        pass1 = request.POST['pass1']
        user = authenticate(username=username, password=pass1)

        if user is not None:
            login(request, user)
            fname = user.first_name
            # messages.success(request, "Logged In Sucessfully!!")
            return render(request, "authentication/index.html", {"fname": fname})
        else:
            messages.error(request, "Bad Credentials!!")
            return redirect('home')

    return render(request, "authentication/signin.html")


def register_user(request):
    if request.method == "POST":
        form = RegisterUserForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data['username']
            password = form.cleaned_data['password1']
            user = authenticate(username=username, password=password)
            login(request, user)
            messages.success(request, ("Registration Successful!"))
            return redirect('home')
    else:
        form = RegisterUserForm()
        return render(request, 'registration/register_user.html', {'form': form})
