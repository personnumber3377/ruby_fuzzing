do |f|
      f.close_read
      f.write "foobarbaz"
      assert_raise(IOError) { f.read }
      assert_nothing_raised(IOError) {f.close_read}
      assert_nothing_raised(IOError) {f.close}
      assert_nothing_raised(IOError) {f.close_read}
    end