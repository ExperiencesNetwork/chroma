#!/usr/bin/env bash

set -e

function cleanup {
  docker compose -f docker-compose.test.yml down --rmi local --volumes
}

trap cleanup EXIT

docker compose -f docker-compose.test.yml up --build -d

cd clients/js 
yarn
yarn test:run
