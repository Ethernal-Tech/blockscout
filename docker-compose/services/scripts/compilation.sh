# !/bin/bash
 
pushd blockscout
mix local.hex --force
mix do deps.get, local.rebar --force, deps.compile
mix compile
popd
