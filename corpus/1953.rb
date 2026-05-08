do |q1, q2|
      EnvUtil.suppress_warning do
        r1 = eval("/(a#{q1})#{q2}/").match('aa')[0]
        r2 = eval("/(?:a#{q1})#{q2}/").match('aa')[0]
        assert_equal(r1, r2)
      end