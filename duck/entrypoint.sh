#!/bin/sh
envsubst < /tmp/.duckdbrc > /home/appuser/.duckdbrc
exec "$@"