FROM openjdk:17
EXPOSE 8080
ADD target/resttest.jar resttest.jar 
ENTRYPOINT ["java","-jar","/resttest.jar"]