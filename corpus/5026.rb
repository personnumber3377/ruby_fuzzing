do |f|
      expected.each_with_index do |e, i|
        /#=> *(.*)/ =~ e or next
        a = f.gets
        assert_not_nil(a, "[ruby-dev:34445]: remained")
        assert_equal($1, a.chomp, "[ruby-dev:34445]: line #{line+i}")
      end