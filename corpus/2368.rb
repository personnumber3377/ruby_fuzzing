do
      include Enumerable
      def each
        %w(bar baz).each{|e| yield e}
      end