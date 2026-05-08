do |s|
      head.grep(/^0/) do |h|
        h = "#{s}#{h}_"
        assert_syntax_error(h, /numeric literal without digits\Z/, "#{bug2407}: #{h.inspect}")
      end