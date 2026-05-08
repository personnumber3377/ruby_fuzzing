do |stdout, stderr, _status|
      assert_empty stderr
      assert_include stdout.join, "true"
    end