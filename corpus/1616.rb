dom_out_of_range
    gen = random_generator {10000000}
    assert_raise(RangeError) {
      [*0..2].shuffle(random: gen)
    }
    gen = random_generator {-1}
    assert_raise(RangeError) {
      [*0..2].shuffle(random: gen)
    }
  end