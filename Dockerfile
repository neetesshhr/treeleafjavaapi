FROM openjdk:11-jdk-slim
WORKDIR /app
COPY . .
EXPOSE 8080
RUN mvn package
ENTRYPOINT ["java", "-jar", "target/treeapi-0.0.1-SNAPSHOT.jar"]
