#!/bin/bash
echo -n "Are you sure you want to IMPORT and OVERWRITE db.sql - y/N? ";
read confirm
if [[ "$confirm" == "y" ]]
then
  docker-compose exec db bash "/tmp/scripts/import.sh"
fi
