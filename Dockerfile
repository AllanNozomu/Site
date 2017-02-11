FROM python:3.5

COPY requirements.txt /requirements.txt
RUN python -m pip install -U pip
RUN python -m pip install -r requirements.txt

COPY ./static/ /static/
COPY ./sitecaco/media/ /media/
COPY . /code/

WORKDIR /code

RUN echo "America/Sao_Paulo" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

VOLUME /code/static

CMD ["gunicorn", "sitecaco.wsgi:application", "--reload", "--bind", "0.0.0.0:8001", "--workers", "4", "--max-requests", "1000"]
