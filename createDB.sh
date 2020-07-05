#!/bin/bash
PW=$IG_PASSWD


echo Building users table
PGPASSWORD=$PW psql -h m6-test.cfunveg3cqlp.us-west-2.rds.amazonaws.com -U image_gallery -c "create table users (username varchar(100) not null primary key, password varchar(100), full_name varchar(200));"

echo Creating users
PGPASSWORD=$PW psql -h m6-test.cfunveg3cqlp.us-west-2.rds.amazonaws.com -U image_gallery -c "insert into users values ('dongji','cpsc4973','dongji - admin')";
PGPASSWORD=$PW psql -h m6-test.cfunveg3cqlp.us-west-2.rds.amazonaws.com -U image_gallery -c "insert into users values ('jwinger','cpsc4973','Jefferey Winger - non admin')";
PGPASSWORD=$PW psql -h m6-test.cfunveg3cqlp.us-west-2.rds.amazonaws.com -U image_gallery -c "insert into users values ('admin','admin','Administrator - admin')";

PGPASSWORD=$PW psql -h m6-test.cfunveg3cqlp.us-west-2.rds.amazonaws.com -U image_gallery -c "select * from users";