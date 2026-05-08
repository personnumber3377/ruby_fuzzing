do
        obj = Object.new
        ObjectSpace.define_finalizer(obj, c1)
        ObjectSpace.define_finalizer(obj, c2)
        obj = nil
      end