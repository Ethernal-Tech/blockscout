# !/bin/bash

cd /explorer/blockscout
mix do ecto.drop, ecto.create, ecto.migrate
touch .initial-blockscout-db-migration
