do |str, grapheme_clusters|
      assert_equal grapheme_clusters, str.each_grapheme_cluster.to_a
      assert_equal grapheme_clusters.size, str.each_grapheme_cluster.size
    end