#!/bin/bash

echo "Building Docker Image..."

docker build -t react-app .

docker tag react-app sathishbalaji03/dev:latest

echo "Done"