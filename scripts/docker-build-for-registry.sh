#!/bin/bash

if [ -z "$1" ]; then
  echo -n "What is your registry tag? ";
  read registry
  docker build -t $registry .;
else
  echo "Building $1"
  docker build -t "$1" .;
fi


