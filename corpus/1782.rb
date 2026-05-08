do
      attr_reader :passed

      def initialize(*args, **kwargs)
        @passed = [args, kwargs]
        super(foo: 1, bar: 2) # so we can experiment with passing wrong numbers of args
      end