do
      def foo(a, b, c=1, *d, e, f:2, **g)
        [a, b, c, d, e, f, g]
      end