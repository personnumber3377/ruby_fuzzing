do |klass|
      t = klass.new(s)
      d = Marshal.dump(t)
      v = assert_nothing_raised(RuntimeError) {break Marshal.load(d, hook)}
      assert_send