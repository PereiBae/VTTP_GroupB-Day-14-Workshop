FROM maven:3.9.9-eclipse-temurin-23-alpine

LABEL name="Spring dov-bear"
LABEL authors="brandonpereira"

ARG APP_DIR=/app
WORKDIR ${APP_DIR}

COPY mvnw .
COPY pom.xml .
COPY .mvn .mvn
COPY src src

RUN mvn package -Dmaven.test.skip=true

ENV SERVER_PORT=8080

EXPOSE ${SERVER_PORT}

ENTRYPOINT java -jar target/dovbear-0.0.1-SNAPSHOT.jar