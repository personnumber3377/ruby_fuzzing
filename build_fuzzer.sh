clang \
  -fsanitize=address,undefined,fuzzer \
  -I. \
  -I./include \
  -I./include/ruby-3.x.0 \
  -I./include/ruby-3.x.0/x86_64-linux \
  -I.ext/include/x86_64-linux/ \
  fuzzer.c \
  libruby-static.a \
  -lpthread -ldl -lm -lz -lcrypt -lgmp \
  -o fuzz_ruby