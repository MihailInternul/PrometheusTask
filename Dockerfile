FROM openjdk:23-jdk-slim

ADD target/spring-petclinic-1.0.0.jar spring-petclinic.jar

COPY jmx_prometheus_javaagent-0.20.0.jar /usr/app/jmx_prometheus_javaagent.jar
COPY config.yaml /usr/app/config.yaml

EXPOSE 9090

ENTRYPOINT ["java", "-javaagent:/usr/app/jmx_prometheus_javaagent.jar=9090:/usr/app/config.yaml", "-jar", "spring-petclinic.jar"]
