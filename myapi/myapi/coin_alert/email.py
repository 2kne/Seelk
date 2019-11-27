

from django.core.mail import send_mail
from django.utils import timezone
from rest_framework.views import APIView




class Email():

    def send(alert):
        from myapi.core.serializers import UserSerializer

        user = UserSerializer.get('first argv', alert['id_user'])
        email = user['email']
        date = timezone.now().strftime("%d %B %Y")
        hour = timezone.now().strftime("%H:%M:%S")

        ctr = alert['value']
        name = alert['ctr']

        message = "Votre alerte sur le "+ name +" s'est delenche a "+hour+" le "+date+". Cette crypto est passe "
        message_end = ''

        if alert['alert_type'] == 0:
            if alert['comparate'] == 0:
                message_end = "en dessous de "+str(ctr)
            elif alert['comparate'] == 1:
                message_end = "au dessus de " +str(ctr)
        elif alert['alert_type'] == 1:
            #Here code for alert type 1 with %
            return False

        message = message + message_end
        send_mail(
            'Alerte '+name,
            message,
            'coin@alert.com',
            [email],
            fail_silently=False,)