do
      remove_method(:m)
      def m(**args)
        args
      end