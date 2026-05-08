do]", rss: true)
    begin;
      str = "hello world".encode(Encoding::UTF_32LE)

      10_000.times do
        str.grapheme_clusters
      end