do
      [short_rpipe, short_wpipe, long_wpipe].each(&:close)
      long_rpipe.read
    end