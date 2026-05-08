do
      remove_method(:m)
      def m(arg=1, **args)
        [arg, args]
      end