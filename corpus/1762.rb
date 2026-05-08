do
      assert_nil(Complex(*args, exception: false))
      assert_nil($!)
    end