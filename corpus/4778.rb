do
      IO.pipe do |r, w|
        assert_nothing_raised {IO.open(w.fileno) {}}
      end