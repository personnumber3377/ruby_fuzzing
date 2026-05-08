do
        k = Struct.new(:m)
        v = k.new(0)
        v::m += raise(bug) rescue 1
        assert_equal(k.new(1), v)
      end