do
      define_method(:b=, instance_method(:a=))
      alias c= a=
    end