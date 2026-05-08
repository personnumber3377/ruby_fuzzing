do |f|
      assert_equal(%w(false), f.read.split(/\n/))
    end