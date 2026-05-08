do |nil: :ng|
      /(?<nil>.)/ =~ "c"
      assert_equal("c", binding.local_variable_get(:nil))
    end