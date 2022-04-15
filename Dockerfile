FROM ubuntu:20.04 
#FROM python:3.8-alpine
#EXPOSE 5000
COPY . ./app
# ADD . /app
WORKDIR /app
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y python3-pip python3-dev default-libmysqlclient-dev build-essential
#ARG MYSQL_ROOT_PASSWORD=rootpassword

# # We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt


ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
