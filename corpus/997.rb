do
      utf8_hash = "{\u3042: 1}"
      assert_equal(eval(utf8_hash).inspect, utf8_hash)
    end