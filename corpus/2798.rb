do |stdout, stderr, status|
      assert_include(stdout.shift, "== disasm:")
      assert_include(stdout.pop, "leave")
      assert_predicate(status, :success?)
    end