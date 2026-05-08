do |x|
      %w(f d e E g G).each do |f|
        v = [x].pack(f).unpack(f)
        if x.nan?
          assert_predicate(v.first, :nan?)
        else
          assert_equal([x], v)
        end