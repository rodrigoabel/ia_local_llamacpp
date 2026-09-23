#!/usr/bin/env bash

# Cambia al directorio donde reside este script
cd "$(dirname "$0")"

# Ejecución del servidor
llama-server \
  --models-preset "./presets.ini" \
  --models-max 1 \
  --host 0.0.0.0
