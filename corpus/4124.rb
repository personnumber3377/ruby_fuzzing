do |idx|
        assert_equal(idx, @it.base64(idx).unpack1('m*').size)
      end