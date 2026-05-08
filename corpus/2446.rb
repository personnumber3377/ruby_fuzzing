dom_int(m, init = 0, iterate: 5)
    srand(init)
    rnds = [Random.new(init)]
    rnds2 = [rnds[0].dup]
    rnds3 = [rnds[0].dup]
    iterate.times do |i|
      w = rand(m)
      rnds.each do |rnd|
        assert_equal(w, rnd.rand(m))
      end