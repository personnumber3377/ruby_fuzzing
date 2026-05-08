do |f|
      f.puts "{ '\u00de' => 'Th', '\u00df' => 'ss', '\u00e0' => 'a' }"
      f.close

      EnvUtil.with_default_external(Encoding::US_ASCII) do
        assert_warn('') {
          load f.path
        }
        assert_nothing_raised(SyntaxError) {
          RubyVM::InstructionSequence.compile_file(f.path)
        }
      end