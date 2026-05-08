don't care

      '(1; cond1..cond2)',
      '(%s(); cond1..cond2)',
      '(%w(); cond1..cond2)',
      '(1; (2; (3; 4; cond1..cond2)))',
      '(1+1; cond1..cond2)',
    ) do |code, pass|
      code = code.sub("cond1", "n==4").sub("cond2", "n==5")
      if pass
        assert_equal([4,5], eval("(1..9).select {|n| true if #{code}}"))
      else
        assert_raise_with_message(ArgumentError, /bad value for range/, code) {
          verbose_bak, $VERBOSE = $VERBOSE, nil # disable "warning: possibly useless use of a literal in void context"
          begin
            eval("[4].each {|n| true if #{code}}")
          ensure
            $VERBOSE = verbose_bak
          end