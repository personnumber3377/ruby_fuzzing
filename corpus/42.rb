do |g, enc|
      g = g.encode(enc)
      assert_equal g.chars, g.grapheme_clusters
    end