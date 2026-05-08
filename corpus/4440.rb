do
      define_method(:respond_to?) do |a, priv = false|
        called << [:respond_to?, a]
        false
      end