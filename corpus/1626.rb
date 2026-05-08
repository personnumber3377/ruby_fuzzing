dom_generator
    ary = (0...10000).to_a
    assert_raise(ArgumentError) {ary.sample(1, 2, random: nil)}
    gen0 = random_generator {|max| max/2}
    gen1 = random_generator do |max|
      ary.replace([])
      max/2
    end