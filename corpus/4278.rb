do
      assert_not_predicate(t1, :stop?)
      assert_not_predicate(t2, :stop?)
      break if c1 > c2
      sleep 0.1
    end