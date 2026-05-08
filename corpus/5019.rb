do
          using $m

          def initialize
            o = $c.new
            o.method(:foo).unbind
          end