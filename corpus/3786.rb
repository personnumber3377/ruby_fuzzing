do |i|
        assert_equal(i, obj.instance_variable_get("@var#{i}"))
      end