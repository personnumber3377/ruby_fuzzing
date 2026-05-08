do |req|
      assert_raise_with_message(SyntaxError, /unexpected/) {require req}
      require req
    end