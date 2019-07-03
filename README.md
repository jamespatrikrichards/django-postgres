# How to use

## Requires Docker

To spin up a new Django project called mysite
1. Clone repository
2. `docker-compose run web django-admin startproject mysite .`
3. In `mysite/manage.py` replace `DATABASES =` with
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}
```
4. `docker-compose up`

When the containers are brought up, the web service will wait until the postgres service is available before starting the Django server. Docker tends not to shutdown postgres elegantly which can result in slowness when restarting the containers. This ensures that the web service always has a database to connect to.