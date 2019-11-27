import time

from django.apps import AppConfig

from .email import Email
import requests
import json
from pprint import pprint


#Here all verifications method for the alerts
def checking_alert():
    from .alert import CoinAlert
    #Email.send("BTC", 1, "lol@gmail")
    api_result = request_api()

    bdd_result = CoinAlert.get_all()
    matching_ctr(bdd_result, api_result)

#Here matching the crypto name with potential alerts in bdd
def matching_ctr(alert_tab, ctr_tab):
    for name, value in ctr_tab.items():
        for alert in alert_tab:
            if name == alert['ctr'] and alert['sended'] == False:
                check = check_truth_alert(alert['alert_type'], alert['value'], value, alert['comparate'])
                if check == True:
                    print(check)
                    do_alert_truth_actions(alert)


#Here checking if the alert is true
def check_truth_alert(alert_type, alert_value, ctr_value, comparate):
    print(alert_type)
    print(ctr_value)
    if alert_type == 0:
        if comparate == 0:
            if alert_value > ctr_value:
                return True
        elif comparate == 1:
            if alert_value < ctr_value:
                return True
    elif alert_type == 1:
        #Here code for % you need to add fields in database I think
        return False
    else: return False

#Here do somes actions if alert is true
def do_alert_truth_actions(alert):
    #Here you can unactive the alert with the sended fields
    Email.send(alert)

    return 'yes'


#Here get info about many cryptocurrency
def request_api():
    url = 'https://rest.coinapi.io/v1/assets'
    key = 'F9B138CE-3E57-456D-9EC1-1FD88E4784EC' #YOUR KEY FOR APICOIN
    headers = {'X-CoinAPI-Key': key}

    result = {}

    response = requests.get(url, headers=headers).json()

    for data in response:
        if 'name' in data and 'price_usd' in data:
            result[data['name']] = data['price_usd']

    return result





request_api()
