do
      def each
        super do |i|
          yield 2 * i
        end