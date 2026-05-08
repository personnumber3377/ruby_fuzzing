dows, which saves under a different filename
    assert_include([filename, "\u00C2\u00AAa123".encode('ISO-8859-1')], matches.first, bug14456)
  end