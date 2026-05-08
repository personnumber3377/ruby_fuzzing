do |f|
      assert_raise(TypeError) do
        f.readline Object.new
      end