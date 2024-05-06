# django-todo
A simple todo app built with django

![image](https://github.com/mayaworld13/Django-todo-app-deployment/assets/127987256/83aa7036-195f-4b42-8edd-375c8c99d5a1)

### Setup
To get this repository, run the following command inside your git enabled terminal
```bash
$ git clone https://github.com/shreys7/django-todo.git
```
You will need django to be installed in you computer to run this app. Head over to https://www.djangoproject.com/download/ for the download guide

Once you have downloaded django, go to the cloned repo directory and run the following command

```bash
$ python manage.py makemigrations
```

This will create all the migrations file (database migrations) required to run this App.

Now, to apply this migrations run the following command
```bash
$ python manage.py migrate
```

One last step and then our todo App will be live. We need to create an admin user to run this App. On the terminal, type the following command and provide username, password and email for the admin user
```bash
$ python manage.py createsuperuser
```

That was pretty simple, right? Now let's make the App live. We just need to start the server now and then we can start using our simple todo App. Start the server by following command

```bash
$ python manage.py runserver
```

Once the server is hosted, head over to http://127.0.0.1:8000/todos for the App.

# Django Todo App  Docker Setup

## Prerequisites

Before you begin, make sure you have the following installed:

- Docker
- Git (optional, for cloning the repository)

## Setup

1. Clone this repository (if you haven't already):

   ```bash
   git clone https://github.com/mayaworld13/Django-todo-app-deployment.git
   ```

2. Navigate to the project directory:

   ```bash
   cd Django-todo-app-deployment
   ```
3. create python file for allowed host file so that the current IP of ec2 is updated and it fetch the details.

4. create a docker image from Dockerfile for todo App
   ```bash
   docker build -t  django-todo-app .
   ```
   
5. Run the container in Detach mode 
   ```bash
   docker run -d -p 8000:8000 django-todo-app
   ```
   
6. Test it ( make sure to add the port 8000 in security bound rules for ec2 instance)
   ```bash
   YOURIP:8000
   ```
   
7. Tag the containter in order to push it in Dockerhub
   ```bash
   docker tag django-todo-app mayaworld13/django-todo-app
   ```

8. Add the credential of Dockerhub ( add secrets)
   ```bash
   docker login
   ```
   
9. push Docker image in  Dockerhub
   ```bash
   docker push mayaworld13/django-todo-app
   ```
   
Cheers and Happy Coding :)
