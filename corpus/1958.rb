do
        # A typical ReDoS case
        /^(a*)*\1$/ =~ "a" * 1000000 + "x"
      end