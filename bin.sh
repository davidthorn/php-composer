#!/bin/bash

if [ -d $2 ]; then
 echo "Directory $2 already exists: exiting"
fi

sudo docker rm -f djt  || exit
sudo docker run -td --name djt davidthorn/php-composer:dev || exit
sudo docker exec -it djt composer create-project $1 /app || exit

# Using `docker cp` is much faster, rather than creating a volume on the container
sudo docker cp djt:/app $2  || exit
sudo docker rm -f djt  || exit