do
      def respond_to_missing?(id, priv)
        if id == :foobar
          true
        else
          false
        end