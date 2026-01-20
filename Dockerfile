# 1단계: Maven 빌드
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 2단계: Tomcat 실행
FROM tomcat:9-jre8
COPY --from=builder /app/target/hello-world.war /usr/local/tomcat/webapps/

