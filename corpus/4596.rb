do |r|
        assert_equal("cd\n", r.read)
        r.close
      end