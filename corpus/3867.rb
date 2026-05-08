do
      def process(action, *args)
        args.freeze
        super
      end