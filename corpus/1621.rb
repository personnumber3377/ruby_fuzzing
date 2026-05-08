do
      assert_include([0, 1, 2], [2, 1, 0].sample)
      samples = [2, 1, 0].sample(2)
      samples.each{|sample|
        assert_include([0, 1, 2], sample)
      }
    end