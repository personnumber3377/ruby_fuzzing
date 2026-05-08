do
      alias_method :warn2, :warn
      remove_method :warn

      if category
        define_method(:warn) do |str, category: nil|
          warning << [str, category]
        end