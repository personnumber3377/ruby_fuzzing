do
        define_method :method_added do |sym|
          added << sym
        end