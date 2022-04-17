FROM ubuntu:20.04 

COPY . ./app
WORKDIR /app
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y python3-pip python3-dev default-libmysqlclient-dev build-essential

COPY ./requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt


ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
