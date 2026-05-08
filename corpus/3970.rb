do
      include Enumerable
      attr_reader :is_lambda
      def each(&block)
        return to_enum unless block
        @is_lambda = block.lambda?
      end