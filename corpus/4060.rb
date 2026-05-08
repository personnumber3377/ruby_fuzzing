do |f|
      f.set_encoding(Encoding.find('iso-8859-1'), Encoding.find('utf-8'))
      assert_equal(Encoding::UTF_8, f.internal_encoding)
      assert_equal(Encoding::ISO_8859_1, f.external_encoding)
    end