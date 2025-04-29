FROM gradle:8.5.0-jdk17 AS build
WORKDIR /app
COPY sprinter-be .
RUN gradle build -x test

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
RUN apt-get update && apt-get install -y curl
COPY --from=build /app/build/libs/*.jar app.jar
COPY --from=build /app/src/main/resources/prompts/ /app/resources/prompts/
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"] 