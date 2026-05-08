double_splat(b: 1, **{})
      CODE
      assert_prism_eval(<<-CODE)
        prism_test_call_node_double_splat(:b => 1)
      CODE

      assert_prism_eval(<<-CODE)
        def self.prism_test_call_node_splat(*); end