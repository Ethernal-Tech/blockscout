# Docker Blockscout with Smart Contract Verifier

## Build Blockscout Image

```bash
docker build -t organization/tag .
```

## Push Blockscout Image to DockerHub

```bash
docker push organization/tag
```

## Set Up Configuration Files

```bash
sudo rm -rf /opt/blockscout && sudo mkdir /opt/blockscout && sudo cp docker-compose/contract-verifier.toml /opt/blockscout/contract-verifier.toml && sudo cp docker-compose/blockscout.env /opt/blockscout/blockscout.env
```

## Remove Old Data

```bash
sudo rm -rf docker-compose/services/blockscout-db-data/ docker-compose/services/logs/
```

## Launch Blockscout and Smart Contract Verifier

```bash
docker compose -f docker-compose/docker-compose.yml up -d
```

## Check `Smart Contract Verifier` Status

```bash
curl http://localhost:8050/health
```

## Retrieve Available `Solidity` Compiler Versions

```bash
curl http://localhost:8050/api/v2/verifier/solidity/versions
```

## Shut Down Blockscout and Smart Contract Verifier

```bash
docker compose -f docker-compose/docker-compose.yml down
```
