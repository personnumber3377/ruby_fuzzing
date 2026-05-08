do |i, o|
      i.timeout = 0.0001
      o.puts("Hello World")
      o.close

      assert_equal "Hello World", i.gets.chomp
    end