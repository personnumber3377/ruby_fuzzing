do
                  x = nil
                  GC.disable
                  1000.times do |n|
                    n.times do
                      x = (foo rescue $!).local_variables
                    end