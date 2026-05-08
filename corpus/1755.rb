do |a|
      [5, 2**62, 2**61].each do |i|
        a.for("%#x"%i) do
          m = myinteger.new(i)
          assert_equal(i, m)
          assert_equal(m, i)
        end