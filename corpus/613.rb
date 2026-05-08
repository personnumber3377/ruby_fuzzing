do |i|
      rs << Ractor.new(i) do |i|
        Encoding.default_external = "us-ascii"
      end