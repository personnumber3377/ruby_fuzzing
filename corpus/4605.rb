do |w|
        w.write(line*81)        # 8100 bytes
        assert_equal(100, w.write("a"*99, "\n"))
      end