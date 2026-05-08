do |code|
      iseq = RubyVM::InstructionSequence.compile(code)
      insn = iseq.disasm
      assert_match(/opt_newarray_send