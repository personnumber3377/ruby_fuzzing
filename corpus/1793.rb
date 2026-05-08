do |len|
          assert_equal((n >> idx) & ((1 << (len + 1)) - 1), n[idx..idx+len], "#{ n }[#{ idx }..#{ idx+len }]")
          assert_equal((n >> idx) & ((1 << len) - 1), n[idx...idx+len], "#{ n }[#{ idx }...#{ idx+len }]")
        end