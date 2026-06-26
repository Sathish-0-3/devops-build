#!/bin/bash

echo "Stopping old container..."

docker compose down

echo "Starting application..."

docker compose up -d

echo "Deployment Completed"