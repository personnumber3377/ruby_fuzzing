do
      include(CoercionToSelf)
      def &(other)
        self.value & other.value
      end