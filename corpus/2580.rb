do |i|
        assert_equal(i, o.instance_variable_get(:"@a#{i}"))
      end