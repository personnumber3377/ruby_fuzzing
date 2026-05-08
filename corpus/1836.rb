do |tmpdir|
      env = ENV_ENABLE_BOX.merge({'TMPDIR'=>tmpdir})
      assert_ruby_status([env], "#{<<~"begin;"}\n#{<<~'end