FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk21

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/Food_delivery.war /usr/local/tomcat/webapps/ROOT.war

ENV PORT=8080
EXPOSE 8080

CMD ["catalina.sh","run"]