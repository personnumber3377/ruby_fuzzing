do
      attr_reader :get, :set
      def v; yield; [*@get, *@set] end