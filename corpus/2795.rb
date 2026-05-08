do |f|
      f.puts "_name = 'Prism'; puts 'hello'"
      f.close

      assert_nothing_raised(TypeError) do
        RubyVM::InstructionSequence.compile_prism(f)
      end