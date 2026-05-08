dout; raise "\x82\xa0"') do |outs, errs, status|
      assert_equal 1, outs.size
      assert_equal 0, errs.size
      err = outs.first.force_encoding('utf-8')
      assert_predicate err, :valid_encoding?
      assert_match %r/\u3042/, err
    end