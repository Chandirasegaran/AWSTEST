# Stage 1: Build stage
FROM eclipse-temurin:17-jdk-jammy as build

WORKDIR /app

# Copy Maven wrapper and POM
COPY --chmod=0755 mvnw mvnw
COPY .mvn/ .mvn/
COPY pom.xml .

# Resolve dependencies
RUN --mount=type=bind,source=pom.xml,target=pom.xml \
    --mount=type=cache,target=/root/.m2 ./mvnw dependency:go-offline -DskipTests

# Copy source code
COPY ./src src/

# Build the application
RUN ./mvnw package

# Stage 2: Package stage
FROM eclipse-temurin:17-jre-jammy AS final

WORKDIR /app

# Copy jar file from build stage
COPY --from=build /app/target/app.jar app.jar

# Extract layers
RUN java -Djarmode=layertools -jar app.jar extract --destination target/extracted

# Copy extracted dependencies and application classes
COPY --from=build /app/target/extracted/dependencies/ ./dependencies/
COPY --from=build /app/target/extracted/spring-boot-loader/ ./spring-boot-loader/
COPY --from=build /app/target/extracted/snapshot-dependencies/ ./snapshot-dependencies/
COPY --from=build /app/target/extracted/application/ ./application/

VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS

EXPOSE 8080

ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
# ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar
