#!/bin/bash

export PGPASSWORD='root'

echo "configuring database"

dropdb -U postgres dragonstackdb
createdb -U postgres dragonstackdb

psql -U postgres dragonstackdb < ./bin/sql/generation.sql
psql -U postgres dragonstackdb < ./bin/sql/dragon.sql
psql -U postgres dragonstackdb < ./bin/sql/trait.sql
psql -U postgres dragonstackdb < ./bin/sql/dragonTrait.sql

node ./bin/insertTraits.js

echo "dragonstackdb configured"
