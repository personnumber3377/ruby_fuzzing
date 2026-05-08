do
        define_method :method_added do |sym|
          memo << sym
          memo << mod.instance_methods(false)
          memo << (mod.instance_method(sym) rescue nil)
        end