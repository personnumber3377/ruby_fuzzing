do |idx|
        assert_not_match(safe, @it.urlsafe_base64(idx))
      end