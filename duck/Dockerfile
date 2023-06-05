FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    wget unzip gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/duckdb/duckdb/releases/download/v0.8.0/duckdb_cli-linux-amd64.zip \
    && unzip duckdb_cli-linux-amd64.zip -d /usr/local/bin \
    && rm duckdb_cli-linux-amd64.zip

# Run as non-root user
RUN useradd --create-home appuser
WORKDIR /home/appuser
USER appuser

COPY .duckdbrc /tmp/.duckdbrc
COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "/bin/bash" ]
CMD [ "entrypoint.sh", "duckdb" ]
