do |t|
      open(t.path, File::RDONLY, flags: File::BINARY) do |f|
        assert_equal true, f.binmode?
        assert_equal binary_enc, f.external_encoding
      end