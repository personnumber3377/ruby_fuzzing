do |code|
      ex = assert_syntax_error(code, w)
      assert_equal(1, ex.message.scan(w).size, ->{"same #{w.inspect} warning should be just once\n#{w.message}"})
    end