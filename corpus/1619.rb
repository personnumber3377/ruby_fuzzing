dom_zero
    zero = Struct.new(:to_int).new(0)
    gen_to_int = random_generator {|max| zero}
    ary = (0...10000).to_a
    assert_equal(ary.rotate, ary.shuffle(random: gen_to_int))
  end