do
      remove_method :foo
      def foo
        [:bar2]
      end