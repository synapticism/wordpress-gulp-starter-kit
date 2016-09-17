#!/bin/bash
docker stop $(docker ps -q)
docker-compose up -d
