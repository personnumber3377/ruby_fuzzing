do |f|
      f.set_encoding('binary')
      assert_equal(Encoding::ASCII_8BIT, f.external_encoding)
    end