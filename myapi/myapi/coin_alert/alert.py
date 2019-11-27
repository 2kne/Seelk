from django.core.mail import send_mail
from django.shortcuts import render
from django.http import HttpResponse
from .models import Coin
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.http import JsonResponse
from .email import Email

class CoinAlert(APIView):

    #permission_classes = [IsAuthenticated]

    """
    Creates the alert.
    """

    def put(self, request, format='json'):
        id_user = request.data['id_user']
        ctr = request.data['ctr']
        alert_type = request.data['alert_type']
        value = request.data['value']
        comparate = request.data['comparate']
        alert = Coin(id_user=id_user, ctr=ctr, alert_type=alert_type, value=value, comparate=comparate)
        alert.save()

        return Response(status=status.HTTP_201_CREATED)


    def get(self, request, id_alert, format='json'):
        alert = {}
        alert['id'] = Coin.objects.get(id=id_alert).pk
        alert['id_user'] = Coin.objects.get(id=id_alert).id_user
        alert['ctr'] = Coin.objects.get(id=id_alert).ctr
        alert['alert_type'] = Coin.objects.get(id=id_alert).alert_type
        alert['value'] = Coin.objects.get(id=id_alert).value
        alert['created_at'] = Coin.objects.get(id=id_alert).created_at
        alert['comparate'] = Coin.objects.get(id=id_alert).comparate
        return JsonResponse(alert, safe=False)


    def post(self, request, format='json'):
        alert = Coin.objects.get(pk=request.data['id'])
        alert.ctr = request.data['ctr']
        alert.alert_type = request.data['alert_type']
        alert.value = request.data['value']
        alert.comparate = request.data['comparate']
        alert = alert.save()
        return Response(alert)

    def delete(self, request):
        alert = Coin.objects.get(pk=request.data['id'])
        result = alert.delete()
        return Response('Deleted')

    #To get alert when you use /user/id_user
    def get_relation(self, id_user):
        alert = list(Coin.objects.values().filter(id_user=id_user))
        return alert

    #To get all alert to check them
    def get_all():
        alert = list(Coin.objects.values())
        return alert

