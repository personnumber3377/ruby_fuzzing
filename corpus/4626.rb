do |r, w|
      s = ""
      t = Thread.new { r.read(5, s) }
      Thread.pass until t.stop?
      assert_raise(RuntimeError) { s.clear }
      w.write "foobarbaz"
      w.close
      assert_equal("fooba", t.value)
    end