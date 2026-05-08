BEGIN { a = 1 }; 2", raw: true)
      assert_prism_eval("b = 2; BEGIN { a = 1 }; a + b", raw: true)
    end

    def test_PostExecutionNode
      assert_prism_eval("END { 1 }