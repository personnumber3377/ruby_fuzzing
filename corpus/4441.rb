do
      define_method(:respond_to?) do |a, b, c|
        called << [:respond_to?, a, b, c]
        false
      end