do |str_pr|
      pr, pr_label = str_pr
      assert_raise(NoMethodError, "NoMethodError expected: #{pr_label}, called in main") { pr.call }
      assert_raise(NoMethodError, "NoMethodError expected: #{pr_label}, called in @box") { @box::ProcInBox.call_proc(pr) }
    end