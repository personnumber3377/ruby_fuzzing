do
      def to_json; "[" + map { |i| i.to_json }.join(",") + "]" end