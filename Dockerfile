FROM node:10.24.0

RUN apt-get update && apt-get upgrade -y

# Remove CURL and git as it is has constant security vulnerabilities and we don't use it
RUN apt-get purge -y --auto-remove curl git

ADD package.json /alarmsTrigger/
RUN cd /alarmsTrigger && npm install --production

ADD provider/. /alarmsTrigger/
