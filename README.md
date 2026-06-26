Hii! This is Sathish...

# React Application Deployment with Docker, Jenkins, AWS, and Monitoring

## Project Overview

This project demonstrates a complete CI/CD pipeline for deploying a React application in a production-ready environment using Docker, Jenkins, GitHub, Docker Hub, AWS EC2, Prometheus, and Grafana.

The application is containerized using Docker, automatically built and deployed through Jenkins pipelines, hosted on an AWS EC2 instance, and monitored using Prometheus and Grafana.

# Clone Repository

git clone https://github.com/sriram-R-krishnan/devops-build

cd devops-build

# Build React Application

# Docker

## Build Image

docker build -t react-app .

## Run Container


docker run -d -p 80:80 --name react-app 

Open

http://13.127.5.209

# Docker Compose

Run

docker compose up -d

Stop

docker compose down

# Bash Scripts

## build.sh

bash build.sh

Builds the Docker image.

## deploy.sh

bash deploy.sh

Deploys the Docker container.


# Git Workflow

Create Dev Branch

git checkout -b dev

Commit Changes

git add .

git commit -m "Commit Message"

git push origin dev

Merge to Master

git checkout master

git merge dev

git push origin master

# Docker Hub

## Public Repository

sathishbalaji03/dev

## Private Repository

sathishbalaji03/prod

# Jenkins CI/CD

Two Jenkins Pipelines were created.

## React-Dev

Branch

dev

Pipeline Tasks

- Clone Repository
- Build Docker Image
- Push Image to Docker Hub Dev Repository
- Deploy Application

## React-Prod

Branch

master

Pipeline Tasks

- Clone Repository
- Build Docker Image
- Push Image to Docker Hub Production Repository
- Deploy Application

# GitHub Webhook

Configured GitHub Webhook to automatically trigger Jenkins on every push.

Webhook URL

http://13.127.5.209:8080/github-webhook/

# AWS Deployment

Instance Type: t3.micro

Operating System: Ubuntu

Application Port: 80

Jenkins Port: 8080

Prometheus: 9090

Grafana: 3000

# Security Group Configuration

| Port | Purpose |
|------|----------|
|22|SSH (My IP)|
|80|React Application|
|8080|Jenkins|
|9090|Prometheus|
|3000|Grafana|

# Monitoring

Monitoring stack consists of

- Prometheus
- Node Exporter
- Grafana

Prometheus continuously collects metrics from Node Exporter.

Grafana visualizes

- CPU Usage
- Memory Usage
- Network Usage
- Disk Usage
- System Health

# Alerting

Grafana Alert Rules are configured.

Notifications are generated whenever the monitored application or server becomes unavailable.

# Deployment URLs

## GitHub Repository

https://github.com/Sathish-0-3/devops-build

## Docker Hub Dev

https://hub.docker.com/sathishbalaji03/dev


## Docker Hub Prod

Private Repository

## Deployed Application

http://13.127.5.209

## Jenkins

http://13.127.5.209:8080

## Prometheus

http://13.127.5.209:9090

## Grafana

http://13.127.5.209:3000