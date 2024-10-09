# !/bin/bash

cd /explorer/blockscout/apps/block_scout_web/assets
npm install
node_modules/webpack/bin/webpack.js --mode production
cd /explorer/blockscout/apps/explorer
npm install
cd /explorer/blockscout
mix phx.digest
cd /explorer/blockscout/apps/block_scout_web
mix phx.gen.cert blockscout blockscout.local
