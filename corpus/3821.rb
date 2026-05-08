do
      remove_method(:m)
      def m(arg, **args)
        [arg, args]
      end