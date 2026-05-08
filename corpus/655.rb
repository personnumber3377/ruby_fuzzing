do |io|
        next if ios.include?(io)
        assert_nothing_raised {io.close}
      end