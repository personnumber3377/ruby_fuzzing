do |r, e|
        module ForkHook
          def _fork
            p :before
            ret = super
            p :after
            ret
          end