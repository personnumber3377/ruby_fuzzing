do
      # Can be obtained with:
      #  $ ruby -e 'Range = Struct.new(:a, :b, :c); p Marshal.dump(Range.new(nil, nil, nil))'
      Marshal.load("\x04\bS:\nRange\b:\x06a0:\x06b0:\x06c0")
    end