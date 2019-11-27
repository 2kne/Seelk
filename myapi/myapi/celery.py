from __future__ import absolute_import
import os
from celery import Celery

from celery.task.schedules import crontab
from celery.decorators import periodic_task

# set the default Django settings module for the 'celery' program.
os.environ['DJANGO_SETTINGS_MODULE'] = 'myapi.settings'
__all__ = ('myapp')
app = Celery('myapi')

from .coin_alert.email import Email
from .coin_alert.tests import checking_alert

# Using a string here means the worker will not have to
# pickle the object when using Windows.
app.config_from_object('django.conf:settings')
app.autodiscover_tasks()

@app.task(bind=True)
def debug_task(self):
    print('Request: {0!r}'.format(self.request))

def test(arg):
    print(arg)

@periodic_task(run_every=(crontab()), name="alert", ignore_result=True)

def alert():
    checking_alert()
    print("goofd")
