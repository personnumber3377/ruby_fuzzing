do |m|
      k = Integer
      assert_kind_of(k, x = rand(m), m.inspect)
      [m, k, x]
    end