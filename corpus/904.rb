do |n, s|
      RubyVM::InstructionSequence.compile(s, __FILE__, nil, n).disasm
    end