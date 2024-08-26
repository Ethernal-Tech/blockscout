# !/bin/bash

pushd blockscout/apps/block_scout_web/assets
npm install
node_modules/webpack/bin/webpack.js --mode production
popd
pushd blockscout/apps/explorer
npm install
popd
mix phx.digest
pushd blockscout/apps/block_scout_web
mix phx.gen.cert blockscout blockscout.local
popd
