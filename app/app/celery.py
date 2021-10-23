from os import environ # pylint: disable=missing-module-docstring
from celery import Celery  # pylint: disable=import-error

environ.setdefault('DJANGO_SETTINGS_MODULE', 'app.settings')

app = Celery('app')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()
