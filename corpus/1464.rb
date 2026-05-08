do |code|
      iseq = RubyVM::InstructionSequence.compile(code)
      insn = iseq.disasm
      assert_match(/opt_duparray_send