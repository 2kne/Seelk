from django.db import models

class Coin(models.Model):
    id_user = models. IntegerField()
    ctr = models.CharField(max_length=100) #cryptocurrency_name
    alert_type = models.IntegerField() # 1=falls or above number, 2=increases by X%
    value = models.FloatField() #cryptocurrency_value
    comparate = models.IntegerField(default=0) # 0 = '<'(passe en dessous de x valeur) and 1 = '>'
    # (passe au dessus de x valeur)this is for alert_type 1
    created_at = models.DateTimeField(auto_now_add=True)
    sended = models.BooleanField(default=False) #if alert is active or not
