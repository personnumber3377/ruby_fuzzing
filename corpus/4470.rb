do |o|
        n = Dir.glob("#{o[0..0]}*")[0]
        pp.assert_equal(o, n, bug7267)
      end