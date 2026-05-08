do |f|
      f.close_write
      assert_equal("0", f.read.chomp)
    end