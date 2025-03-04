# Stage 1: Build the application
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline  
COPY src ./src
RUN mvn clean package -DskipTests  

# Stage 2: Create the final image
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
COPY src/main/webapp /app/src/main/webapp
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
