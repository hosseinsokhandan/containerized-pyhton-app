#!/bin/sh

exec "$@"

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input --clear

python manage.py flush --no-input
python manage.py loaddata */fixtures/*.json
# django-admin makemessages -l fa -e py
# django-admin makemessages -l en -e py

# django-admin compilemessages
python manage.py runserver 0.0.0.0:80
