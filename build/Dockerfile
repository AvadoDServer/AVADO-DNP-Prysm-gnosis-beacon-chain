FROM debian:buster-slim 

COPY --from=ghcr.io/gnosischain/gbc-prysm-beacon-chain:v2.0.5-gbc /app/cmd/beacon-chain/beacon-chain /usr/local/bin/beacon-chain

RUN apt update && \
  apt install -y ca-certificates file && \
  rm -rf /var/lib/apt/lists/*
  
COPY /config/bootnodes.yaml /root/sbc/config/
COPY /config/config.yml /root/sbc/config/

ENTRYPOINT [ "sh", "-c", "exec beacon-chain \ 
    --datadir=/data \
    --rpc-host=0.0.0.0 \
    --grpc-gateway-host=0.0.0.0 \
    --monitoring-host=0.0.0.0 \
    --p2p-local-ip=0.0.0.0 \
    --http-web3provider=\"http://nethermind-gnosis.my.ava.do:8545\" \
    --fallback-web3provider=\"https://rpc.xdaichain.com/\" \
    --grpc-gateway-port=3500 \
    --grpc-gateway-corsdomain=\"*\" \
    --accept-terms-of-use \
    --contract-deployment-block=\"19469077\" \
    --bootstrap-node /root/sbc/config/bootnodes.yaml \
    --config-file /root/sbc/config/config.yml \
    --chain-config-file /root/sbc/config/config.yml \
    --p2p-tcp-port 13001 \
    --p2p-udp-port 12001 \
    --p2p-max-peers 25 \
    --min-sync-peers 1 \
    $EXTRA_OPTS" ]