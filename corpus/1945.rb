do |enc|
      idx = key.encode(enc)
      pat = /#{idx}/
      EnvUtil.with_default_internal(enc) do
        test.call {|m| assert_raise_with_message(IndexError, pat, bug10877) {m[idx]} }
        test.call {|m| assert_raise_with_message(IndexError, pat, bug18160) {m.offset(idx)} }
        test.call {|m| assert_raise_with_message(IndexError, pat, bug18160) {m.begin(idx)} }
        test.call {|m| assert_raise_with_message(IndexError, pat, bug18160) {m.end