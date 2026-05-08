do
      line = "x"*9+"\n"
      file = "test.out"
      open(file, "wb") do |w|
        w.write(line)
        assert_equal(11, w.write(line, "\n"))
      end