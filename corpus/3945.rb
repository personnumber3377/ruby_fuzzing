do
      t = Time.gm(2000)
      assert_predicate(t, :gmt?)
      t.localtime
      assert_not_predicate(t, :gmt?)
      t.localtime
      assert_not_predicate(t, :gmt?)
      t.gmtime
      assert_predicate(t, :gmt?)
      t.gmtime
      assert_predicate(t, :gmt?)
    end