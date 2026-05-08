do |f|
        assert_equal true, f.binmode?
        assert_equal binary_enc, f.external_encoding
      end