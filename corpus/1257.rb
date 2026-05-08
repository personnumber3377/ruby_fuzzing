do
      def cached_foo_callsite = foo

      def foo = :v1

      host = self
      @refinement = Module.new do
        refine(host) do
          def foo = :unused
        end