#### Session Video:
    https://drive.google.com/file/d/1e0P_fh72IgdNvN78DwxVYhgJrtnEVQod/view?usp=sharing
    
#### Step By Step Docker Image Baking Process 
```
STEP-1: Launch an EC2 Instance of Ubuntu 

STEP-2: Install Docker & Docker-Compose

hostnamectl set-hostname "docker-compose.cloudbinary.io"
echo "`hostname -I | awk '{ print $1}'` `hostname`" >> /etc/hosts 
sudo apt-get update
sudo apt-get install git curl unzip tree wget -y 
sudo apt-get install docker.io -y 
sudo apt-get install docker-compose -y 
sudo usermod -aG docker ubuntu
sudo chmod 777 /var/run/docker.sock
sudo systemctl enable docker
sudo systemctl restart docker

STEP-3: Connect EC2 Instance using SSH/SSM 

STEP-4: Create a files using touch Dockerfile 


vi Dockerfile 
# syntax=docker/dockerfile:1
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/


vi requirements.txt

Django>=3.0,<4.0
psycopg2>=2.8

vi docker-compose.yml

services:
  db:
    image: postgres
    volumes:
      - ./data/db:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
  web:
    build: .
    command: python manage.py runserver 0.0.0.0:8000
    volumes:
      - .:/code
    ports:
      - "8000:8000"
    environment:
      - POSTGRES_NAME=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
    depends_on:
      - db

STEP-5: Create a Django project 

$ sudo docker compose run web django-admin startproject cloudops .

STEP-6 : Change the User & Group Permissions

$ sudo chown -R $USER:$USER cloudops * 

STEP-7: Connect the database

In your project directory, edit the cloudops/settings.py file.

import os

ALLOWED_HOSTS = ['*']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_NAME'),
        'USER': os.environ.get('POSTGRES_USER'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
        'HOST': 'db',
        'PORT': 5432,
    }
}

These settings are determined by the postgres Docker image specified in docker-compose.yml.

Save and close the file.

STEP-8: Run the docker compose up command from the top level directory for your project.

$ docker-compose images
$ docker images
$ docker-compose ps
$ docker-compose up
$ docker-compose down

STEP-9: Take EC2 Instance IPaddress and Validate 

http://<ec2_instance_public_ip>


