do
        define_method(:eval_input) do
          IRB::Irb.module_eval { alias_method :eval_input, :to_s }
          GC.start
          Kernel
        end