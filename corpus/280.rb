do |e|
      [:set, :add].each do |type|
        assert_equal(e + [type], events[type].shift)
      end