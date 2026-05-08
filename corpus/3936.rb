do
      t = Time.local(2013, 2, 24)
      assert_equal('JST', Time.local(2013, 2, 24).zone)
      t = Marshal.load(Marshal.dump(t))
      assert_equal('JST', t.zone)
      assert_equal('JST', (t+1).zone, '[ruby-core:81892] [Bug #13710]')
    end