do
      define_method(:to_ary) do
        raise bug10748
      end