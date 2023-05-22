# Stage 1: Build the Maven project and package the application
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ /app/src/
RUN mvn package -DskipTests

# Stage 2: Create a lightweight Java runtime image and copy the packaged application
FROM openjdk:11-jdk-slim
WORKDIR /app
COPY --from=build /app/target/treeapi-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "treeapi-0.0.1-SNAPSHOT.jar"]
