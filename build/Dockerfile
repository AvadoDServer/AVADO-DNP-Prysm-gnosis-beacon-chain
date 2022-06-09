FROM debian:buster-slim 

COPY --from=ghcr.io/gnosischain/gbc-prysm-beacon-chain:v2.1.2-gbc /app/cmd/beacon-chain/beacon-chain /usr/local/bin/beacon-chain

RUN apt update && \
  apt install -y ca-certificates file wondershaper vim bash && \
  rm -rf /var/lib/apt/lists/*
  
COPY /config/bootnodes.yaml /root/sbc/config/
COPY /config/config.yml /root/sbc/config/

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]