@echo off
llama-server.exe ^
  -m "Qwen3.6-35B-A3B"/Qwen3.6-35B-A3B-UD-Q4_K_XL.gguf ^
  -mm "Qwen3.6-35B-A3B"/mmproj-BF16.gguf ^
  --image-min-tokens 1024 ^
  --gpu-layers 38 ^
  --fit off ^
  -ncmoe  33 ^
  --cache-idle-slots ^
  --spec-type draft-mtp ^
  --spec-draft-n-max 3 ^
  --reasoning on ^
  -c 131072 ^
  -t 8 ^
  -fa on ^
  --temp 0.6 ^
  --top_p 0.95 ^
  --top_k 20 ^
  --min_p 0.0 ^
  --parallel 1 ^
  --repeat-penalty 1.1 ^
  --log-verbosity 3 ^
  --cache-type-k q8_0 ^
  --cache-type-v q8_0 ^
  --cache-type-k-draft q8_0 ^
  --cache-type-v-draft q8_0 ^
  -a Qwen3.6-35B-A3B
pause