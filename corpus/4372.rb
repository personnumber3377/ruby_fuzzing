do |e|
      unless e.ascii_compatible?
        format = e.dummy? ? "%p".force_encoding(e) : "%p".encode(e)
        assert_raise(Encoding::CompatibilityError) do
          sprintf(format, nil)
        end