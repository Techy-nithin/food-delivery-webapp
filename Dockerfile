FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:resolve
COPY src ./src
RUN mvn package -DskipTests

FROM tomcat:10.1-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/food-delivery.war /usr/local/tomcat/webapps/ROOT.war

ENV CATALINA_OPTS="-Dport.http=$PORT"
RUN sed -i 's/port="8080"/port="${port.http}"/' /usr/local/tomcat/conf/server.xml

EXPOSE $PORT
CMD ["catalina.sh", "run"]
