do
      utf8_ascii_hash = '{"\\u3042": 1}'
      assert_equal(eval(utf8_ascii_hash).inspect, utf8_ascii_hash)
    end