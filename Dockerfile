FROM python:3.7.9

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    libpq-dev \
    gcc \
    python3-dev \
    musl-dev \
    libc-dev \
    libxslt-dev \
    libxml2

RUN apt-get install gettext -y

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# PIP
RUN pip install --upgrade pip
COPY ./app/requirements.txt /usr/src/app/requirements.txt
RUN pip install --no-cache -r requirements.txt


COPY ./app/ /usr/src/app/

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]