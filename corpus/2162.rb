do |_out, err, _status|
      def foo = nil
      foo{}          # warn
      send