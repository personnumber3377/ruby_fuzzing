do
      assert_equal(31.0*2**-1027, Float("0x1f"+("0"*268)+".0p-2099"))
      assert_equal(31.0*2**-1027, Float("0x1f"+("0"*600)+".0p-3427"))
      assert_equal(-31.0*2**-1027, Float("-0x1f"+("0"*268)+".0p-2099"))
      assert_equal(-31.0*2**-1027, Float("-0x1f"+("0"*600)+".0p-3427"))
    end