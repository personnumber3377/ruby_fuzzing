do
      begin
        verbose_bak, $VERBOSE = $VERBOSE, nil
        def test
          :test
        end