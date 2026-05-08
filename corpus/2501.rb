dom.seed
      rand1 = Random.rand
      $VERBOSE = verbose
      rand2 = Random.new(seed).rand
      assert_equal(rand1, rand2)

      srand seed
      rand3 = rand
      assert_equal(rand1, rand3)
    end