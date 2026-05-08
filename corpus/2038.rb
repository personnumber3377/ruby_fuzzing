do
        s = Foo # this opt_getconstant_path needs warmup, so 2.times is needed
        Class.new(Foo).const_set(:Bar, s::Bar)
      end