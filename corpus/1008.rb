do
      h.each {|i, j|
        h.delete(i);
        assert_not_equal(false, i, bug9105)
      }
    end