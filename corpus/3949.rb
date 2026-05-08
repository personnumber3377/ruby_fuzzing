do |method|
      bug6100 = '[ruby-core:42997]'

      t = Time.utc(2001, 4, 17, 19, 23, 17, 300000)
      assert_equal("2001-04-17T19:23:17Z", t.__send