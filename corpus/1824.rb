do |const_pr|
      pr, pr_label = const_pr
      assert_equal 111, pr.call, "111 expected, #{pr_label} called in main"
      assert_equal 111, @box::ProcInBox.call_proc(pr), "111 expected, #{pr_label} called in @box"
    end