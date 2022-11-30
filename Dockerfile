FROM ubuntu:latest


RUN apt-get -y update
RUN apt-get install -y apache2 curl
EXPOSE 80
WORKDIR ./Project5/website
COPY index.html ./
COPY formsubmit.html ./
COPY app.js ./
COPY styles.css ./

ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
