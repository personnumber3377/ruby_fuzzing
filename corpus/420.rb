do |sec|
      assert_raise_with_message(ArgumentError, /not.*negative/) { sleep(sec) }
    end