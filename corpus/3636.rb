do |k, v|
      assert_predicate(k, :frozen?)
      assert_predicate(v, :frozen?)
    end