do |f|
      {#
        $stderr = $stdout
        print ARGF.readpartial(256)
        ARGF.readpartial(256) rescue p($!.class)
        ARGF.readpartial(256) rescue p($!.class)
      };
      assert_equal("1\n2\nEOFError\nEOFError\n", f.read)
    end