do |sym|
      assert_equal(':"' + sym + '"', sym.intern.inspect)
    end