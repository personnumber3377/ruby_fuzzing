do
        o = Object.new
        ObjectSpace.define_finalizer(o) { }
      end