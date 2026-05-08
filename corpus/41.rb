do |g, enc|
      g = g.encode(enc)
      assert_equal [g], g.grapheme_clusters
    end