do
      def a(**k)
        before = k.dup
        super
        [before, k]
      end