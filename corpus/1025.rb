do
      before = ObjectSpace.count_objects[:T_STRING]
      5.times{ h["abc".freeze] }
      assert_equal before, ObjectSpace.count_objects[:T_STRING]
    end