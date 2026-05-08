class C\u{30a8 30e9 30fc} < RuntimeError; self; end".encode(Encoding::EUC_JP))}
    exc.inspect

    err = EnvUtil.verbose_warning do
      assert_raise(exc) do
        $DEBUG, debug = true, $DEBUG
        begin
          raise exc
        ensure
          $DEBUG = debug
        end
      end
    end
    assert_include(err, exc.to_s)
  end

  def test_break_ensure
    bad = true
    while true
      begin
        break
      ensure
        bad = false
      end
    end
    assert(!bad)
  end

  def test_catch_no_throw
    assert_equal(:foo, catch {:foo})
  end

  def test_catch_throw
    result = catch(:foo) {
      loop do
        loop do
          throw :foo, true
          break
        end
        assert(false, "should not reach here