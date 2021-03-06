FROM ubuntu:20.04

MAINTAINER chunk

RUN apt-get update -y && \  
    apt-get install -y python3-pip python3-dev && \
    mkdir /code && \
    rm -rf /var/lib/apt/lists/* 
    

COPY ./requirements.txt /code/requirements.txt

WORKDIR /code

RUN pip3 install -r requirements.txt

COPY . /code

ENTRYPOINT [ "python3" ]

CMD ["/code/manage.py","runserver","0.0.0.0:8000"]

