bar", b)
        end

        bar = :ok
        prism_eval_binding(binding)
      CODE
    end

    def test_ScopeNode
      assert_separately(%w[], <<~'RUBY')
        def compare_eval(source)
          ruby_eval = RubyVM::InstructionSequence.compile("module A; " + source + "; end