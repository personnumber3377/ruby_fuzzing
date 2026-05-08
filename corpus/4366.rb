do |str|
      dump = str.dump
      assert_equal(str, eval(dump), "[ruby-dev:33142]")
      assert_equal(str, dump.undump)
      assert_equal(str, eval("# frozen-string-literal: true\n#{dump}"), '[Bug #14687]')
    end