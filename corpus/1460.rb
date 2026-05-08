do |fsl|
      iseq = RubyVM::InstructionSequence.compile(code,
                                                 frozen_string_literal: fsl)
      assert_same(*iseq.eval,
                  "[ruby-core:85542] [Bug #14475] fsl: #{fsl}")
    end