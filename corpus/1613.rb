dom.new(0)
    assert_raise(ArgumentError) {[1, 2, 3].shuffle(1, random: gen)}
    srand(0)
    100.times do
      assert_equal([0, 1, 2].shuffle, [0, 1, 2].shuffle(random: gen))
    end