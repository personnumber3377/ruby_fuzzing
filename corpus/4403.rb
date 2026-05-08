do
      assert_equal [0], "\000".unpack("*U")
    end