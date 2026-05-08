do
      assert_raise(exc) do
        $DEBUG, debug = true, $DEBUG
        begin
          raise exc
        ensure
          $DEBUG = debug
        end