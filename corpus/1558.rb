do
      t = Time.now
      marshal_equal(t, t.usec.to_s)
    end