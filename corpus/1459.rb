do |opt|
      iseq = RubyVM::InstructionSequence.compile(code,
                                                 frozen_string_literal: opt)
      insn = iseq.disasm
      assert_match %r{putobject\s+#{Regexp.quote('"1.8.0"..."1.8.8"')}}, insn
      assert_match %r{putobject\s+#{Regexp.quote('"2.0.0".."2.3.2"')}}, insn
      assert_no_match(/putstring/, insn)
      assert_no_match(/newrange/, insn)
    end