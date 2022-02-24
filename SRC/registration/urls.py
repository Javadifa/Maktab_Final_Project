from django.urls import path, include
from . import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns


urlpatterns = [
    path('', views.login_user, name="login"),
    path('home/', views.home, name="home"),
    path('logout_user/', views.logout_user, name='logout'),
    path('register_user', views.register_user, name='register_user'),

    # path('logout_user', views.logout_user, name='logout'),
    # path('register_user', views.register_user, name='register_user'),
]
urlpatterns += staticfiles_urlpatterns()