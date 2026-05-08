do |i|
      mesg = "10**#{i}"
      s = Integer.sqrt(n = 10**i)
      if i.even?
        assert_equal(10**(i/2), Integer.sqrt(n), mesg)
      else
        assert_include((s**2)...(s+1)**2, n, mesg)
      end