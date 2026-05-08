do |r, e|
      t1 = Thread.new { sleep }
      Thread.pass
      t2 = Thread.new { loop { Thread.pass } }
      Thread.new { }.join
      p [Thread.current, t1, t2].map{|t| t.object_id }.sort
      p Thread.list.map{|t| t.object_id }.sort
    INPUT
      assert_equal(r.first, r.last)
      assert_equal([], e)
    end