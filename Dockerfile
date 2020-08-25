FROM openjdk:8-jre as builder
WORKDIR build
ARG JAR_FILE=target/layered-jar-demo.jar
COPY ${JAR_FILE} app.jar
RUN java -Djarmode=layertools -jar app.jar extract && rm app.jar

FROM amazoncorretto:11
LABEL maintainer="pwoer4j@outlook.com"
ENV TZ=Asia/Shanghai
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"
WORKDIR app

COPY --from=builder build/dependencies/ ./
COPY --from=builder build/snapshot-dependencies/ ./
COPY --from=builder build/spring-boot-loader/ ./
COPY --from=builder build/application/ ./

EXPOSE 8081

CMD java $JAVA_OPTS org.springframework.boot.loader.JarLauncher