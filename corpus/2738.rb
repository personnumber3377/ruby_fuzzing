do
      define_method(:foo) do |res|
        um.bind(self).call(res)
      end