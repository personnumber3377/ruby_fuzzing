do |ivar_name, val|
      assert_equal(obj.instance_variable_get(ivar_name), val)
      assert_equal(duped_obj.instance_variable_get(ivar_name), val)
    end