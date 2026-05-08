do |g|
      assert_equal [g], g.each_grapheme_cluster.to_a
      assert_equal 1, g.each_grapheme_cluster.size
    end