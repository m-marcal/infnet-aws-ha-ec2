#!/bin/bash
apt update -y

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

docker run -d -e TIMDb_API_KEY=${TIMDb_API_KEY} -p80:5000 marcelomarcal/imdb-top-100:latest


