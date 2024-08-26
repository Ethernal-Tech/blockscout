# !/bin/bash

chown -R explorer /explorer/scripts/
chgrp -R explorer-group /explorer/scripts/

./scripts/compilation.sh
./scripts/db-migration.sh
./scripts/npm-start.sh
./scripts/start-blockscout.sh
