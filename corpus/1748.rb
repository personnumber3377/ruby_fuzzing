do |i|
      assert_equal(0.5, f.round(i+1), bug14635 + " (argument: #{i+1})")
    end