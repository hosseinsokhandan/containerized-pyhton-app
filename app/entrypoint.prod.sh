#!/bin/sh

exec "$@"

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input --clear

gunicorn \
  --bind  "0.0.0.0:80" \
  --access-logfile '-' \
  --error-logfile '-' \
  --workers 9 \
  --worker-class gthread \
  --threads 20 \
  --timeout 60 \
  --limit-request-line 0 \
  --limit-request-field_size 0 \
  "app.wsgi:application"