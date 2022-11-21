FROM ubuntu:latest


RUN apt-get -y update
RUN apt-get install -y apache2 curl
EXPOSE 80
WORKDIR /home/ubuntu/cicd-3120-zeldafan664/Project5/website/src
COPY index.html /home/ubuntu/cicd-3120-zeldafan664/Project5/website/src/index.html
COPY formsubmit.html /home/ubuntu/cicd-3120-zeldafan664/Project5/website/src/formsubmit.html
COPY app.js /home/ubuntu/cicd-3120-zeldafan664/Project5/website/src/app.js
COPY styles.css /home/ubuntu/cicd-3120-zeldafan664/Project5/website/src/styles.css
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]


