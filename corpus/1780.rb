don't share unnecessary functionality
    assert_raise(TypeError) { Data.define(:foo, keyword_init: true) }

    assert_not_respond_to(Data.define, :define, "Cannot define from defined Data class")
  end