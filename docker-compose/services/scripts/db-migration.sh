# !/bin/bash

pushd blockscout
# drop is needed when doing a reset of an existing environment
# mix do ecto.drop, ecto.create, ecto.migrate
mix do ecto.create, ecto.migrate
touch .initial-blockscout-db-migration
popd
