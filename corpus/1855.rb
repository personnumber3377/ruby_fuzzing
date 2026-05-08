do
      assert_raise(bug9568) do
        $DEBUG, debug = true, $DEBUG
        begin
          raise bug9568
        ensure
          $DEBUG = debug
        end