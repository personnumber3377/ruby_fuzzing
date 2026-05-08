do |f|
      f.set_encoding(Encoding.find('binary'))
      assert_equal(Encoding::ASCII_8BIT, f.external_encoding)
    end