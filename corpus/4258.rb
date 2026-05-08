do
        ObjectSpace.define_finalizer(Object.new, raise_proc)
        Thread.handle_interrupt(RuntimeError => :immediate) {break}
        Thread.handle_interrupt(RuntimeError => :on_blocking) {break}
        Thread.handle_interrupt(RuntimeError => :never) {break}
      end