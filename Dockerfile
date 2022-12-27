# Maven build container

FROM maven:3.8.5-openjdk-11 AS maven_build

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn package

#pull base image

FROM openjdk

#expose port 809
#EXPOSE 8090

#default command
CMD java -jar /data/spring-boot-jpa-h2-0.0.1-SNAPSHOT.jar

#copy hello world to docker image from builder image

COPY --from=maven_build /tmp/target/spring-boot-jpa-h2-0.0.1-SNAPSHOT.jar /data/spring-boot-jpa-h2-0.0.1-SNAPSHOT.jar