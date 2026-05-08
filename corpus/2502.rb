dom
    [0, 1, 100].each do |size|
      v = Random.urandom(size)
      assert_kind_of(String, v)
      assert_equal(size, v.bytesize)
    end