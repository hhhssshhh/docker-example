FROM python:3.7

RUN pip install flask
COPY . /usr/src/app

WORKDIR /usr/src/app

EXPOSE 4996
ENTRYPOINT ["python", "app.py"]