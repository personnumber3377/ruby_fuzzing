do |r|
      s = "a" * 1000
      assert_raise(IOError, "[ruby-dev:31650]") { 200.times { r.ungetc s } }
    end