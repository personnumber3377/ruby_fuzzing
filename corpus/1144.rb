do
      def recursive_length
        if empty?
          0
        else
          self[1..-1].recursive_length + 1
        end