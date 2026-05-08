do
      obj.one
      tp_two.enable(target: obj.method(:two)) do
        obj.two
      end