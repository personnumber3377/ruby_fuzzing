dom(obj, dump = obj.inspect)
    a = [obj.hash.to_s]
    3.times {
      assert_in_out_err(["-e", "print (#{dump}).hash"], "") do |r, e|
        a += r
        assert_equal([], e)
      end