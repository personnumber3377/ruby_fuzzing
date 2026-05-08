dows-31J UTF-8].each {|ename|
      enc = Encoding.find(ename)
      if enc == r.encoding
        assert_nothing_raised { r =~ "\xc2\xa1".force_encoding(enc) }
      else
        assert_raise(Encoding::CompatibilityError) { r =~ "\xc2\xa1".force_encoding(enc) }
      end