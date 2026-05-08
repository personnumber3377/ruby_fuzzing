do
        o = new.(42)
        assert_raise(TypeError, msg) {File.path(o)}

        o = new.("abc".encode(Encoding::UTF_32BE))
        assert_raise(Encoding::CompatibilityError, msg) {File.path(o)}

        ["\0", "a\0", "a\0c"].each do |path|
          o = new.(path)
          assert_raise(ArgumentError, msg) {File.path(o)}
        end