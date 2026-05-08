do
          ObjectSpace.define_finalizer(Object.new, raise_proc)
        end