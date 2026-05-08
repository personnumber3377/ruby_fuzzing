do
      b = Marshal.load(Marshal.dump(a))
      assert_equal(ClassISO8859_1, b.class, bug1932)
      assert_equal(a.instance_variables, b.instance_variables, bug1932)
      assert_equal(b, b.instance_variable_get(a.instance_variables[0]), bug1932)
    end