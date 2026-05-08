do
      def respond_to_missing?(method, stuff)
        return false if method == :to_ary
        super
      end