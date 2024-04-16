FROM openjdk:17-slim
LABEL maintainer="Mahdi El Faleh"
COPY /target/spring-petclinic-3.2.0-SNAPSHOT.jar /home/spring-petclinic.jar
CMD ["java","-jar","/home/spring-petclinic.jar"]

