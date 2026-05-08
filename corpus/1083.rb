do |level|
      expr = "("*level+")"*level
      assert_equal("nil", eval("defined? #{expr}"), "#{bug8224} defined? #{expr}")
      assert_equal("nil", eval("defined?(#{expr})"), "#{bug8224} defined?(#{expr})")
    end