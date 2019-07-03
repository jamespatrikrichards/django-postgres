FROM python:3-alpine
ENV PYTHONBUFFERED 1
RUN apk update && apk add --no-cache postgresql postgresql-dev gcc python3-dev musl-dev bash
RUN pip install pipenv
RUN mkdir /code
WORKDIR /code
ADD . /code/
RUN pipenv install --system --deploy