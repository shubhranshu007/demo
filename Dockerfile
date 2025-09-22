FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy JAR into container
COPY app.jar app.jar

# Expose port (adjust if your app uses another one)
EXPOSE 8080

# Run the JAR
CMD ["java", "-jar", "app.jar"]
