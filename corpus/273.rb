down
    set_trace_func(nil)
    if defined?(RubyVM)
      RubyVM::InstructionSequence.compile_option = @original_compile_option
    end