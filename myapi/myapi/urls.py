"""myapi URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.urls import path
from django.views.decorators.csrf import csrf_exempt
from myapi.core import views, user
from myapi.coin_alert import alert, email
from rest_framework.authtoken.views import obtain_auth_token #Token ask
from myapi.core.user import CustomAuthToken

urlpatterns = [

    path('admin/', admin.site.urls),
    path('api-token-auth/', obtain_auth_token, name='api_token_auth'), #Token route ask for user

    #USER

    path('user/register/', views.User.as_view(), name='account-create'), #PUT
    path('user/<int:id_user>/', views.User.as_view()),           #GET
    path('user/update/', views.User.as_view()),                 #POST
    path('user/delete/', views.User.as_view()),                 #DELETE

    path('login/', CustomAuthToken.as_view()),                  #LOGIN
    path('logout/', CustomAuthToken.as_view()),                 #LOGOUT

    #ALERT COIN

    path('alert/create/', alert.CoinAlert.as_view()),              #PUT
    path('alert/<int:id_alert>/', alert.CoinAlert.as_view()),   #GET
    path('alert/update/', alert.CoinAlert.as_view()),           #POST
    path('alert/delete/', alert.CoinAlert.as_view())             #DELETE




]
