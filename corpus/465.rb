do
      [long_rpipe, long_wpipe, short_wpipe].each(&:close)
      short_rpipe.read
    end