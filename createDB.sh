#!/bin/bash

USER=$IG_USER
DATABASE=$IG_DATABASE
HOST=$PG_HOST
PW=`cat $IG_PASSWD_FILE`
AWS_ACCESS_KEY_ID=AKIAQVAXHQ5BYBNCRXF7
AWS_SECRET_ACCESS_KEY=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

echo Building users table

PGPASSWORD=$PW psql -h $HOST -U $USER -c "create table users (username varchar(100) not null primary key, password varchar(100), full_name varchar(200));"

echo Creating users

PGPASSWORD=$PW psql -h $HOST -U $USER -c "insert into users values ('dongji','cpsc4973','dongji - admin')";
PGPASSWORD=$PW psql -h $HOST -U $USER -c "insert into users values ('jwinger','cpsc4973','Jefferey Winger - non admin')";
PGPASSWORD=$PW psql -h $HOST -U $USER -c "insert into users values ('admin','admin','Administrator - admin')";

PGPASSWORD=$PW psql -h $HOST -U $USER -c "select * from users";
