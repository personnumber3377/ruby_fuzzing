do |code|
      iseq = RubyVM::InstructionSequence.compile(code)
      insn = iseq.disasm
      assert_match(/opt_new/, insn)
      assert_match(/OptNewFoo:.+@a=1, @b=2/, iseq.eval.inspect)
      # clean up to avoid warnings
      Object.send