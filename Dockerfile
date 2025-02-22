#Tells Docker to use the official python 3 image from dockerhub as a base image
FROM python:3
# Sets an environmental variable that ensures output from python is sent straight to the terminal without buffering it first
ENV PYTHONUNBUFFERED 1
# Sets the container's working directory to /app
WORKDIR /app
# Copies all files from our local project into the container
# runs the pip install command for all packages listed in the requirements.txt file
ADD requirements.txt /app/
ADD . /app/
RUN pip install -r requirements.txt 
RUN python manage.py makemigrations 
RUN python manage.py migrate
