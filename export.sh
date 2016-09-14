#!/usr/bin/env bash
mysqldump -u root -p$MYSQL_ROOT_PASSWORD wordpress > /tmp/db.sql
