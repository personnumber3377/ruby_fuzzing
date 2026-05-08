dom_srand0
    gen = Random.new(0)
    srand(0)
    a = (1..18).to_a
    (0..20).each do |n|
      100.times do |i|
        assert_equal(a.sample(n), a.sample(n, random: gen), "#{i}/#{n}")
      end