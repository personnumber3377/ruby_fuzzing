do |f|
      f.binmode
      f.write(iseq_to_binary(RubyVM::InstructionSequence.of(1.method(:abs))))
      f.close
      assert_separately(["-", f.path], "#{<<~"begin;"}\n#{<<~'end