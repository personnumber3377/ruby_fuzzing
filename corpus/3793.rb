do |enc|
      k = key.encode(enc)
      e = assert_raise_with_message(ArgumentError, "named{#{k}} after numbered") {sprintf("%1${#{k}}s", key: "value")}
      assert_equal(enc, e.message.encoding)
      e = assert_raise_with_message(ArgumentError, "named{#{k}} after unnumbered(2)") {sprintf("%s%s%{#{k}}s", "foo", "bar", key: "value")}
      assert_equal(enc, e.message.encoding)
      e = assert_raise_with_message(ArgumentError, "named{#{k}} after <key>") {sprintf("%<key>{#{k}}s", key: "value")}
      assert_equal(enc, e.message.encoding)
      e = assert_raise_with_message(ArgumentError, "named{key} after <#{k}>") {sprintf("%<#{k}>{key}s", k.to_sym => "value")}
      assert_equal(enc, e.message.encoding)
      e = assert_raise_with_message(KeyError, "key{#{k}} not found") {sprintf("%{#{k}}", {})}
      assert_equal(enc, e.message.encoding)
    end