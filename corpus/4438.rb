do
      define_method(:to_ary) do
        called << [:to_ary, bug5158]
      end