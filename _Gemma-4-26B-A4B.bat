@echo off
llama-server.exe ^
  -m "Gemma-4-26B-A4B"/gemma-4-26B-A4B-it-qat-UD-Q4_K_XL.gguf ^
  -mm "Gemma-4-26B-A4B"/mmproj-BF16.gguf ^
  --model-draft "Gemma-4-26B-A4B"/mtp-Gemma-4-26B-A4B-it-Q4_0.gguf ^
  --gpu-layers 38 ^
  --fit off ^
  -ncmoe 15^
  --cache-idle-slots ^
  --spec-type draft-mtp ^
  --spec-draft-n-max 4 ^
  --reasoning on ^
  -c 131072 ^
  -t 8 ^
  --cache-type-k q4_0 ^
  --cache-type-v q4_0 ^
  -fa on ^
  --temp 1.0 ^
  --top_p 0.95 ^
  --top_k 64 ^
  --min_p 0.1 ^
  --parallel 1 ^
  --repeat-penalty 1.1 ^
  --log-verbosity 3 ^
  -a Gemma4-26B-A4B
pause