do |t|
      t.puts code
      t.close
      assert_in_out_err(["-r#{t.path}", '-e', code], "", [categories.expected(1)]*2, [])
      assert_in_out_err(["-r#{t.path}", '-w', '-e', code], "", [categories.expected(2)]*2, [])
      categories.each do |category, |
        assert_in_out_err(["-r#{t.path}", "-W:#{category}", '-e', code], "", [categories.expected(category => 'true')]*2, [])
        assert_in_out_err(["-r#{t.path}", "-W:no-#{category}", '-e', code], "", [categories.expected(category => 'false')]*2, [])
      end