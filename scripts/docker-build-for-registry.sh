#!/bin/bash

if [ -z "$1" ]; then
  echo -n "What is your registry tag? ";
  read registry
  docker build -t $registry .;
  docker push -t $registry;
else
  echo "Building $1"
  docker build -t "$1" .;
  docker push -t "$1";
fi


