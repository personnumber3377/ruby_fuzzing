do
      def initialize(odd:)
        raise ArgumentError, "Not odd" unless odd.odd?
        super(odd: odd)
      end