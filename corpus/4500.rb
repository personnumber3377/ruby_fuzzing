do
      b = Marshal.load(Marshal.dump(a))
      assert_equal(ClassISO8859_1, b.class, bug1932)
      assert_equal(a.instance_variables, b.instance_variables, bug1932)
      a.instance_variables.each do |i|
        assert_equal(a.instance_variable_get(i), b.instance_variable_get(i), bug1932)
      end