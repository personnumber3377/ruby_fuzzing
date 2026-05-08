do |t|
        RubyVM::InstructionSequence.new(nil)
      rescue TypeError
      else
        raise "TypeError was not raised during RubyVM::InstructionSequence.new"
      end