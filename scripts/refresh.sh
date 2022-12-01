#!/bin/sh
# Pull latest version of the image
sudo docker pull zeldafan64/p5website
# Remove unused images
sudo docker image prune -f
# Stop the container
sudo docker stop p5website
# Remove the container
sudo docker rm p5website
# Recreate the container
sudo docker run -p 8080:80 -d --name p5website zeldafan64/p5website
