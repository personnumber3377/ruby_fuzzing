do
      def respond_to_missing?(id, priv)
        !(id !~ /\Agadzoks\d+\z/) ^ priv
      end