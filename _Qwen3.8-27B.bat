@echo off
llama-server.exe ^
  -m "Qwen3.8-27B\Qwen3.8-27B-GSQ-RCO-IQ3_XXS-mtp.gguf" ^
  -mm "Qwen3.8-27B\mmproj-Qwen3.8-27B-BF16.gguf" ^
  --spec-type draft-mtp ^
  --spec-draft-n-max 3 ^
  --fit off ^
  --load-mode none ^
  --gpu-layers all ^
  -t 8 ^
  --threads-batch 8 ^
  -b 1024 ^
  -fa on ^
  --reasoning on ^
  -c 65536 ^
  --temp 0.6 ^
  --top_p 0.95 ^
  --top_k 20 ^
  --presence-penalty 1.5 ^
  --cache-type-k q4_0 ^
  --cache-type-v q4_0 ^
  --parallel 1 ^
  --kv-unified ^
  --log-verbosity 4 ^
  -a Qwen3.8-27B
pause