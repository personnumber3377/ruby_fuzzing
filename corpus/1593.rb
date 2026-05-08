do
        ary = (1..100).to_a
        ary.sort! {|a,b| ary.replace(xary); a <=> b}
        GC.start
        assert_equal(xary, ary, '[ruby-dev:34732]')
      end