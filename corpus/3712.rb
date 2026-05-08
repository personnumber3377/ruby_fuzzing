do |ivar_name, val|
      assert_equal(obj.instance_variable_get(ivar_name), val)
      assert_equal(cloned_obj.instance_variable_get(ivar_name), val)
    end