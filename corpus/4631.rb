do |r, w|
      s = "xxx"
      t = Thread.new {r.read(2, s)}
      Thread.pass until t.stop?
      t.kill
      t.value
      assert_equal("xxx", s)
    end