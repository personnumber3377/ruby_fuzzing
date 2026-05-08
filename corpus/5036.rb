dout = $stdout
    argf = ARGF.class.new(name.encode(Encoding::UTF_16LE))
    assert_raise(Encoding::CompatibilityError) do
      argf.gets
    end