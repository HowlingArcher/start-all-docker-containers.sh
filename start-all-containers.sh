#!/bin/bash

echo "Starting all Docker containers..."
for container in $(docker ps -aq); do
    name=$(docker inspect --format '{{.Name}}' $container | sed 's|/||')
    echo "Starting container: $name ($container)"
    docker start $container
done
echo "All Docker containers have been started."
