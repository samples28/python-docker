FROM registry-vpc.cn-beijing.aliyuncs.com/moseeker/python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
EXPOSE 8000
CMD [ "python3", "app.py" ]
