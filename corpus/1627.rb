dom_generator_half
    half = Struct.new(:to_int).new(5000)
    gen_to_int = random_generator {|max| half}
    ary = (0...10000).to_a
    assert_equal(5000, ary.sample(random: gen_to_int))
  end