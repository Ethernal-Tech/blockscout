# !/bin/bash

cd /explorer/blockscout
mix do ecto.create, ecto.migrate
touch .initial-blockscout-db-migration
