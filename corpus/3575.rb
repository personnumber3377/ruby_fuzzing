eval('1 + 1')", raw: true)
      assert_prism_eval("a = 1; eval('a + 1')", raw: true)

      assert_prism_eval(<<~CODE, raw: true)
        def prism_eval_splat(**bar)
          eval("bar