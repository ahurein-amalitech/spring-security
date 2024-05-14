# Use an official OpenJDK runtime as a parent image
FROM openjdk:21-jdk-slim AS builder
WORKDIR /app

COPY .mvn .mvn
COPY mvnw .

COPY pom.xml .

RUN chmod +x mvnw

COPY src src

RUN ./mvnw clean package


FROM openjdk:21-jdk-slim

COPY --from=builder /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]