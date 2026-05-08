do |_out, err, _status|
      def foo = nil; b = nil
      foo(&b)       # no warning
      1.object_id{} # no warning because it is written in C

      class C
        def initialize
        end