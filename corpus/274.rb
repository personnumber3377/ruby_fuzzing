do
      attr_writer :bar
      alias_method :set_bar, :bar=
      remove_method :bar=
    end