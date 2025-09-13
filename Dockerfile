# Build
FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -B -q -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -B -DskipTests clean package

# Run
FROM eclipse-temurin:21-jre
WORKDIR /app
ENV SPRING_PROFILES_ACTIVE=prod
COPY --from=build /app/target/apple-academy-api-0.0.1-SNAPSHOT.jar app.jar
CMD ["sh","-c","java -jar app.jar --server.port=$PORT"]
