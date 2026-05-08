do |f|
      assert_equal([@t1.path, @t2.path, @t3.path].inspect, f.gets.chomp)
      assert_equal([@t1.path, @t2.path, @t3.path].inspect, f.gets.chomp)
    end