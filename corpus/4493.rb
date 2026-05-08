do |r, w|
      th = Thread.new {Marshal.dump(o1, w)}
      o2 = Marshal.load(r)
      th.join
      assert_equal(o1.str, o2.str)
    end