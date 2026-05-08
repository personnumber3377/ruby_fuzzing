do
      assert_nothing_raised { eval("a = 1; /\#{ a }/; a") }
      assert_nothing_raised { eval("a = 1; /\#{ a }/o; a") }
    end