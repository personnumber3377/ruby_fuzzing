do
      Marshal.dump((0..1000).map {|x| C4.new(x % 50 == 25) })
    end