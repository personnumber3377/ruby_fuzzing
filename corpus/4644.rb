do |f|
      f.write "foobarbaz"
      f.close_write
      assert_equal("foobarbaz", f.read)
      assert_nothing_raised(IOError) {f.close_write}
      assert_nothing_raised(IOError) {f.close}
      assert_nothing_raised(IOError) {f.close_write}
    end