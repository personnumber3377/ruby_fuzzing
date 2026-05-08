#!/bin/sh
ASAN_OPTIONS="detect_leaks=0" LIBFUZZER_PYTHON_MODULE="ruby_token_mutator" PYTHONPATH="." ./fuzz_ruby -max_len=1000 -timeout=1 in/
