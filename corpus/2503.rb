do
      v = Random.new_seed
      assert_kind_of(Integer, v)
      size += v.size
    end