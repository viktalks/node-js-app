#!/bin/bash
#
docker rm -f nodejs-container || true
#
docker run -d -p 3000:3000 --name nodejs-container viktalks/nodejs-jenkins-cicd:latest

