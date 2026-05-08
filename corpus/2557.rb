do
      assert_raise(RuntimeError) {
        q << true
        num.to_s
        end