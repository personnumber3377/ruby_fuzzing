do
      define_method(:respond_to?) do |*a|
        called << [:respond_to?, *a]
        false
      end