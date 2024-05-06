FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the whole application directory into the container at /app
COPY . /app/

# Install Django
RUN pip install django

# Copy the script to update ALLOWED_HOSTS
COPY update_allowed_hosts.py /app/

# Run the script to update ALLOWED_HOSTS
RUN python update_allowed_hosts.py

# Run migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

# Create a superuser (Replace 'admin' with desired username, and provide password and email)
RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'adminpassword')" | python manage.py shell

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

