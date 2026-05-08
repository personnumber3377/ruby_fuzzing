do |idx|
        (0..100).each do |len|
          assert_equal((n >> idx) & ((1 << len) - 1), n[idx, len], "#{ n }[#{ idx }, #{ len }]")
        end