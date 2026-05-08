do
      def to_json; "{" + map { |k, v| k.to_s.dump + ":" + v.to_json }.join(",") + "}" end