do |f|
      f.set_encoding(Encoding.find('binary'), Encoding.find('utf-8'))
      assert_equal(nil, f.internal_encoding)
      assert_equal(Encoding::ASCII_8BIT, f.external_encoding)
    end