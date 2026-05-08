do
      attr_reader :arg
      def initialize(msg = nil)
        @arg = msg
        super(msg)
      end