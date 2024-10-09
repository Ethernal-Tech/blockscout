# !/bin/bash
 
cd blockscout
mix local.hex --force
mix do deps.get, local.rebar --force, deps.compile
mix compile
