do
      i = 0

      File.open("text#{i+=1}", "w+:utf-8") do |f|
        f.write("Test\nok\u{bf}ok\n")
        f.rewind

        assert_equal("Test\nok\u{bf}", f.readline("\u{bf}"))
        assert_equal("ok\n", f.readline("\u{bf}"))
      end