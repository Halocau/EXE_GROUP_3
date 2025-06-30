# Production stage - Direct deployment with Java compilation
FROM tomcat:10.0-jdk17-openjdk-slim

# Set environment variables
ENV CATALINA_HOME=/usr/local/tomcat
ENV CATALINA_BASE=/usr/local/tomcat
ENV CATALINA_TMPDIR=/usr/local/tomcat/temp
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:+UseG1GC"

# Create non-root user for security
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat

# Install necessary packages including curl and wget for healthcheck
RUN apt-get update && apt-get install -y \
    fontconfig \
    libfreetype6 \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Remove default Tomcat applications for security
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the entire web application directory
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Copy JAR dependencies to WEB-INF/lib
COPY lib/ /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

# Copy environment file
COPY .env /usr/local/tomcat/webapps/ROOT/.env

# Copy Java source files to a temporary location
COPY src/java/ /tmp/src/

# Install JDK for compilation
RUN apt-get update && apt-get install -y openjdk-17-jdk

# Create classes directory
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Build classpath for compilation - use Tomcat's servlet API
RUN echo "Building classpath..." && \
    echo "Tomcat lib directory contents:" && \
    ls -la /usr/local/tomcat/lib/ && \
    echo "" && \
    echo "WEB-INF/lib directory contents:" && \
    ls -la /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/ && \
    echo "" && \
    echo "Creating classpath..." && \
    find /usr/local/tomcat/lib -name "*.jar" -exec echo -n "{}:" \; > /tmp/classpath.txt && \
    find /usr/local/tomcat/webapps/ROOT/WEB-INF/lib -name "*.jar" -exec echo -n "{}:" \; >> /tmp/classpath.txt && \
    echo "" >> /tmp/classpath.txt && \
    echo "Final classpath:" && \
    cat /tmp/classpath.txt

# Compile Java files with all dependencies
WORKDIR /tmp/src
RUN echo "Compiling Java files..." && \
    CLASSPATH=$(cat /tmp/classpath.txt) && \
    echo "Using classpath: $CLASSPATH" && \
    find . -name "*.java" -print -exec javac -cp "$CLASSPATH" -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes {} \; && \
    echo "Compilation completed"

# Verify compilation
RUN echo "Verifying compiled classes..." && \
    find /usr/local/tomcat/webapps/ROOT/WEB-INF/classes -name "*.class" | head -10

# Clean up JDK but keep curl and wget for healthcheck
RUN rm -rf /tmp/src /tmp/classpath.txt && \
    apt-get remove -y openjdk-17-jdk && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Copy custom server configuration with port 9090
COPY docker/server.xml /usr/local/tomcat/conf/server.xml

# Create necessary directories and set permissions
RUN mkdir -p /usr/local/tomcat/logs \
    && mkdir -p /usr/local/tomcat/temp \
    && mkdir -p /usr/local/tomcat/work \
    && mkdir -p /usr/local/tomcat/webapps/ROOT/uploads \
    && chown -R tomcat:tomcat /usr/local/tomcat

# Set proper permissions
RUN chown -R tomcat:tomcat /usr/local/tomcat/conf

# Switch to non-root user
USER tomcat

# Expose port 9090
EXPOSE 9090

# Health check with comprehensive monitoring
HEALTHCHECK --interval=30s --timeout=15s --start-period=180s --retries=3 \
    CMD curl -f --connect-timeout 10 --max-time 15 --retry 2 --retry-delay 5 \
         -H "User-Agent: HealthCheck/1.0" \
         http://localhost:9090/ || \
         wget --timeout=15 --tries=2 --waitretry=5 \
              --user-agent="HealthCheck/1.0" \
              -q -O - http://localhost:9090/ || exit 1

# Start Tomcat
CMD ["catalina.sh", "run"]

