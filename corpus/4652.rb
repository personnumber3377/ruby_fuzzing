do |f|
      assert_raise(TypeError) do
        f.readline 1, 2
      end