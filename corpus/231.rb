do |a|
      a.for("lhs = arg") do
        v = bug
        v = raise(bug) rescue "ok"
        assert_equal("ok", v)
      end