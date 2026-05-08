do
        obj = Object.new
        ObjectSpace.define_finalizer(obj, method(:c1))
        ObjectSpace.define_finalizer(obj, method(:c2))
        obj = nil
      end