#!/bin/sh
echo "Starting the Gnosis beacon chain"
exec beacon-chain \
    --datadir=/data \
    --rpc-host=0.0.0.0 \
    --grpc-gateway-host=0.0.0.0 \
    --monitoring-host=0.0.0.0 \
    --p2p-local-ip=0.0.0.0 \
    --http-web3provider="http://nethermind-gnosis.my.ava.do:8545" \
    --fallback-web3provider="https://rpc.xdaichain.com/" \
    --grpc-gateway-port=3500 \
    --grpc-gateway-corsdomain="*" \
    --accept-terms-of-use \
    --contract-deployment-block="19469077" \
    --bootstrap-node /root/sbc/config/bootnodes.yaml \
    --config-file /root/sbc/config/config.yml \
    --chain-config-file /root/sbc/config/config.yml \
    --p2p-tcp-port 13001 \
    --p2p-udp-port 12001 \
    ${EXTRA_OPTS}