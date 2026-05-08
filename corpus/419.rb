do
      s = run_in_child("abort")
      assert_not_predicate(s, :success?)
      File.write("test-script", "#{<<~"begin;"}\n#{<<~'end