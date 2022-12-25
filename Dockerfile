FROM openjdk:11

COPY target/spring-boot-jpa-h2-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8090

ENTRYPOINT ["java", "-jar", "/app.jar"]