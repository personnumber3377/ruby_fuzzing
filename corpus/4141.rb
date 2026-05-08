do |nl|
      opts = {newline: :universal, nl => true}
      ec2 = assert_warning(/:newline option precedes/, opts.inspect) do
        Encoding::Converter.new("", "", **opts)
      end