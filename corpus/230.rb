do |code, pass|
      token = Random.bytes(4).unpack1("H*")
      if pass
        assert_equal(token, eval("#{code} =~ #{token.dump}; a"))
      else
        verbose_bak, $VERBOSE = $VERBOSE, nil # disable "warning: possibly useless use of a literal in void context"
        begin
          assert_nil(eval("#{code} =~ #{token.dump}; defined?(a)"), code)
        ensure
          $VERBOSE = verbose_bak
        end