do
      def respond_to_missing?(name, bool)
        name == :foo
      end