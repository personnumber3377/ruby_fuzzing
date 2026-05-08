dom" + Marshal.dump([1,0,1])[2..]) }
    assert_raise(ArgumentError) { Marshal.load("\x04\bU:\vRandom" + Marshal.dump([1,-1,1])[2..]) }
  end