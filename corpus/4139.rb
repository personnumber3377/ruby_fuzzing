do
      alias _to_f to_f
      def to_f
        (self + 1)._to_f
      end