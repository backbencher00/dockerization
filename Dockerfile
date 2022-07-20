FROM openjdk:8-jre
MAINTAINER singhsourabh074@gmail.com

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && apt-get install tzdata procps net-tools -y && apt-get upgrade -y && apt-get autoremove
RUN mkdir /opt/application
WORKDIR /opt/application
COPY ./marketplace-service.jar marketplace-service.jar


EXPOSE 7079

CMD java -jar -Dproperty.environment=stage marketplace-service.jar
