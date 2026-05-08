do
        k = Struct.new(:C)
        v = k.new(0)
        v.C += raise bug rescue 1
        assert_equal(k.new(1), v)
      end