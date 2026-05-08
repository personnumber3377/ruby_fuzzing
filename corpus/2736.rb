do
      def foo(result)
        result << "B"
        super
      end