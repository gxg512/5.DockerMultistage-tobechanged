FROM maven:3.6.3-openjdk-16-slim AS build

COPY . /usr/local/mobile-app-ws

WORKDIR /usr/local/mobile-app-ws/

RUN mvn -Dmaven.test.skip=true clean package


FROM tomcat:8

COPY --from=build /usr/local/mobile-app-ws/target/maigolab_hello-1.0.0.jar /usr/local/tomcat/webapps/mobile-app-ws.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
