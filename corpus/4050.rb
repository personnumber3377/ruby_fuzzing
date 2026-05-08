do |r, w|
      assert_nothing_raised(bug5567) do
        assert_warning(/Unsupported/, bug5567) {r.set_encoding("fffffffffffxx")}
        w.puts("foo")
        assert_equal("foo\n", r.gets)
        assert_warning(/Unsupported/, bug5567) {r.set_encoding("fffffffffffxx", "us-ascii")}
        w.puts("bar")
        assert_equal("bar\n", r.gets)
        assert_warning(/Unsupported/, bug5567) {r.set_encoding("us-ascii", "fffffffffffxx")}
        w.puts("zot")
        begin
          assert_equal("zot\n", r.gets)
        rescue Encoding::ConverterNotFoundError => e
          assert_match(/\((\S+) to \1\)/, e.message)
        end