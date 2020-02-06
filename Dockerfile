FROM openjdk:11-jdk as build
COPY galvanizeEnterpriseRootCA1.crt $JAVA_HOME/lib/security
RUN ls
RUN \
    cd $JAVA_HOME/lib/security \
    && keytool -keystore cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias ldapcert -file galvanizeEnterpriseRootCA1.crt
VOLUME /tmp
COPY . .
RUN ./gradlew clean build

FROM openjdk:11-jdk
RUN ls
WORKDIR /app
COPY --from=build build/libs/*.jar app.jar
ARG JAR_FILE
ENTRYPOINT ["java", "-jar", "app.jar"]
EXPOSE 8080

#docker build -t hello-controller .
#docker run -d -p8080:8080 --rm hello-controller