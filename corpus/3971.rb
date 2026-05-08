do
      attr_reader :to_f
      def initialize(val)
        @to_f = Float(val)
      end