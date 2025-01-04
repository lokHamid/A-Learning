# OpenJDK base image
FROM openjdk:17-jdk-slim

# working dir
WORKDIR /app

COPY target/A-Learning-Springboot-0.0.1-SNAPSHOT.jar app.jar

# (default is 8080)
EXPOSE 8080

# Command to run the JAR file
ENTRYPOINT ["java","-jar", "app.jar"]


