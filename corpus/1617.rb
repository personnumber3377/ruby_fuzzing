dom_clobbering
    ary = (0...10000).to_a
    gen = random_generator do
      ary.replace([])
      0.5
    end