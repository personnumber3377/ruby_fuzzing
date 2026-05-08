done = true
      th.join
      assert_equal(:ok, q.pop)
    }
  end