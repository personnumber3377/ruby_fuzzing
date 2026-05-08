do |enc|
      next if enc.dummy?
      strs = strings.map {|s| s.encode(enc)} rescue next
      yield(*strs)
    end