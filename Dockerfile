# Multi-stage build for production
FROM maven:3.8.4-openjdk-16 AS builder

# Set working directory
WORKDIR /app

# Copy pom.xml and build files first for better caching
COPY pom.xml ./
COPY build.xml ./
COPY nbproject/ ./nbproject/

# Download dependencies (this layer will be cached if pom.xml doesn't change)
RUN mvn dependency:go-offline -B

# Copy source code
COPY src/ ./src/
COPY web/ ./web/

# Build the application
RUN mvn clean package -DskipTests

# Production stage
FROM tomcat:9.0-jdk16-openjdk-slim

# Set environment variables
ENV CATALINA_HOME=/usr/local/tomcat
ENV CATALINA_BASE=/usr/local/tomcat
ENV CATALINA_TMPDIR=/usr/local/tomcat/temp
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"

# Create non-root user for security
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat

# Install necessary packages
RUN apt-get update && apt-get install -y \
    fontconfig \
    libfreetype6 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Remove default Tomcat applications for security
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy built application from builder stage
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Copy custom server configuration with port 9090
COPY docker/server.xml /usr/local/tomcat/conf/server.xml

# Create necessary directories and set permissions
RUN mkdir -p /usr/local/tomcat/logs \
    && mkdir -p /usr/local/tomcat/temp \
    && mkdir -p /usr/local/tomcat/work \
    && chown -R tomcat:tomcat /usr/local/tomcat

# Set proper permissions
RUN chown -R tomcat:tomcat /usr/local/tomcat/conf

# Switch to non-root user
USER tomcat

# Expose port 9090
EXPOSE 9090

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:9090/ || exit 1

# Start Tomcat
CMD ["catalina.sh", "run"]

