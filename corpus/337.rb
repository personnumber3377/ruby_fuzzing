do
      _a = 1
      Thread.new{
        _b = 2
        _c = 3
      }.join
      _d = 4
    end