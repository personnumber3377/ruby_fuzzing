do
        o = Object.new
        ObjectSpace.define_finalizer(o, fzer)
      end