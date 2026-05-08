do
      o = Object.new
      [Encoding::UTF_16BE, Encoding::UTF_16LE, Encoding::UTF_32BE, Encoding::UTF_32LE].each do |e|
        o.instance_eval "undef inspect;def inspect;'abc'.encode('#{e}');end