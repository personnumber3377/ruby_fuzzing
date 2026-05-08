dom_invalid_generator
    ary = (0...10).to_a
    assert_raise(NoMethodError) {
      ary.shuffle(random: Object.new)
    }
    assert_raise(NoMethodError) {
      ary.shuffle!(random: Object.new)
    }
  end