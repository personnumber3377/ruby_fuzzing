do |heap|
      env["RUBY_GC_HEAP_#{heap}_INIT_SLOTS"] = "200000"
    end