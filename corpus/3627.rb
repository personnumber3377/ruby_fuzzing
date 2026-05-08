dontexist.rb", error.message

      assert_raise TypeError do
        RubyVM::InstructionSequence.compile_file_prism(nil)
      end