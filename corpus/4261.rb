do
        ObjectSpace.define_finalizer(Object.new, f)
      end