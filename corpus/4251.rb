do |heap|
      env["RUBY_GC_HEAP_#{heap}_INIT_SLOTS"] = sizes[heap].to_s
    end