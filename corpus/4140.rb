do |i|
      newlines.combination(i) do |opts|
        assert_raise(Encoding::ConverterNotFoundError, "#{opts} are mutually exclusive") do
          Encoding::Converter.new("", "", **opts.inject({}) {|o,nl|o[nl]=true;o})
        end