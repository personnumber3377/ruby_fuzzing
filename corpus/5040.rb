do |f|
      {#
        p ARGF.external_encoding.is_a?(Encoding)
        p ARGF.internal_encoding.is_a?(Encoding)
        ARGF.gets
        p ARGF.external_encoding.is_a?(Encoding)
        p ARGF.internal_encoding
      };
      assert_equal("true\ntrue\ntrue\nnil\n", f.read)
    end