do
      c = Class.new
      100.times { Class.new(c) }
      assert(c.subclasses.size <= 100)
    end