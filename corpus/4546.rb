do |r|
        r.gets
        assert_equal "a", r.gets(chomp: true)
        assert_nil r.gets
        r.close
      end