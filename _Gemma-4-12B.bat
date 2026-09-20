@echo off
llama-server.exe ^
  -m "gemma-4-12B"/gemma-4-12B-it-qat-UD-Q4_K_XL.gguf ^
  -mm "gemma-4-12B"/mmproj-BF16.gguf ^
  --model-draft "gemma-4-12B"/mtp-gemma-4-12B-it-Q4_0.gguf ^
  -ngl 99 ^
  -c 65536 ^
  -t 8 ^
  --cache-type-k q8_0 ^
  --cache-type-v q8_0 ^
  -fa on ^
  --temp 0.7 ^
  --top_p 0.95 ^
  --top_k 64 ^
  --min_p 0.1 ^
  --repeat-penalty 1.1 ^
  -a Gemma4-12B
pause