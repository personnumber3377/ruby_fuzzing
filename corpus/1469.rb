do |code|
      iseq = RubyVM::InstructionSequence.compile(code)
      insn = iseq.disasm
      assert_no_match(/opt_new/, insn)
    end