FROM anapsix/alpine-java:8_jdk 

MAINTAINER holandajunior

RUN          apk add --no-cache bash && \
             wget "http://downloads.typesafe.com/typesafe-activator/1.3.12/typesafe-activator-1.3.12-minimal.zip" && \
             unzip typesafe-activator-1.3.12-minimal.zip && \
             mv activator-1.3.12-minimal/bin/activator /usr/local/bin && \
             mv activator-1.3.12-minimal/libexec /usr/local && \
             rm -rf activator-1.3.12-minimal/ && \
             rm typesafe-activator-1.3.12-minimal.zip && \
             echo "`activator list-templates`"

WORKDIR /app
EXPOSE 9000
