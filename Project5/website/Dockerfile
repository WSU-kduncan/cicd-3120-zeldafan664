FROM ubuntu:latest


RUN apt-get -y update 
RUN apt-get install -y apache2 curl
EXPOSE 80
WORKDIR /var/www
COPY index.html /var/www/html/index.html
COPY formsubmit.html /var/www/html/formsubmit.html 
COPY app.js /var/www/scripts/app.js
COPY styles.css /var/www/css/styles.css
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

