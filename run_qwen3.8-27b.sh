#!/usr/bin/env bash
set -e

# Cambiar al directorio donde se encuentra este script
cd "$(dirname "$0")"

# Buscar el archivo del modelo principal
MODEL_PATH="Qwen3.8-27b/Qwen3.8-27B-GSQ-RCO-IQ3_XXS%2BMTP.gguf"
if [ ! -f "$MODEL_PATH" ]; then
    # Por si se renombra o decodifica el %2B a '+' o similar
    MODEL_PATH=$(find Qwen3.8-27b/ -maxdepth 1 -name "*.gguf" ! -name "mmproj*" | head -n 1)
fi

# Archivo del proyector multimodal
MMPROJ_PATH="Qwen3.8-27b/mmproj-F16.gguf"
if [ ! -f "$MMPROJ_PATH" ]; then
    MMPROJ_PATH=$(find Qwen3.8-27b/ -maxdepth 1 -name "mmproj*.gguf" | head -n 1)
fi

echo "=========================================================="
echo "Iniciando Llama.cpp Server en NVIDIA RTX 5070 Ti"
echo "Modelo:   $MODEL_PATH"
echo "Vision:   $MMPROJ_PATH"
echo "Web UI:   http://localhost:8080"
echo "=========================================================="

exec llama-server \
  -m "$MODEL_PATH" \
  -mm "$MMPROJ_PATH" \
  --spec-type draft-mtp \
  --spec-draft-n-max 3 \
  --fit off \
  --load-mode none \
  --gpu-layers all \
  -t 8 \
  --threads-batch 8 \
  -b 1024 \
  -fa on \
  --reasoning on \
  -c 65536 \
  --temp 0.6 \
  --top-p 0.95 \
  --top-k 20 \
  --presence-penalty 1.5 \
  --cache-type-k q4_0 \
  --cache-type-v q4_0 \
  --parallel 1 \
  --kv-unified \
  --log-verbosity 4 \
  -a Qwen3.8-27B \
  --host 0.0.0.0 \
  --port 8080
