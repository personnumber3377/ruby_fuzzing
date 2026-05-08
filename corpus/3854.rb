do
      def method_missing(*args, **kw)
        [args, kw]
      end