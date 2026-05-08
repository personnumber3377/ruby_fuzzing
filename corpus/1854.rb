do
      def to_s
        require '\0'
      rescue LoadError
        self.class.to_s
      end