do |r, w|
      s = ""
      t = Thread.new { r.read(5, s) }
      Thread.pass until t.stop?
      t.kill
      t.value
      assert_equal("", s)
    end