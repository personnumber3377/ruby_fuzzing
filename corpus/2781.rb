do
      RubyVM::InstructionSequence.compile 'using Module.new; yield'
    end