do |file|
      t1 = File.ctime(file)
      t2 = File.open(file) {|f| f.ctime}
      assert_kind_of(Time, t1)
      assert_kind_of(Time, t2)
      assert_equal(t1, t2)
    end