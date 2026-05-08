do |sym|
      assert_equal(sym, Marshal.load(Marshal.dump(sym)), '[ruby-core:24788]')
    end