do
      remove_method :warn
      alias_method :warn, :warn2
      remove_method :warn2
    end