dout and stderr is not supported" if windows?
      Process.wait spawn(RUBY, "-e", "STDERR.print 'err'; STDOUT.print 'out'",
                         STDOUT=>"out",
                         STDERR=>[:child, 3],
                         3=>[:child, 4],
                         4=>[:child, STDOUT]
                        )
      assert_equal("errout", File.read("out"))

      IO.popen([RUBY, "-e", "STDERR.print 'err'; STDOUT.print 'out'", STDERR=>[:child, STDOUT]]) {|io|
        assert_equal("errout", io.read)
      }

      assert_raise(ArgumentError) { Process.wait spawn(*TRUECOMMAND, STDOUT=>[:child, STDOUT]) }
      assert_raise(ArgumentError) { Process.wait spawn(*TRUECOMMAND, 3=>[:child, 4], 4=>[:child, 3]) }
      assert_raise(ArgumentError) { Process.wait spawn(*TRUECOMMAND, 3=>[:child, 4], 4=>[:child, 5], 5=>[:child, 3]) }
      assert_raise(ArgumentError) { Process.wait spawn(*TRUECOMMAND, STDOUT=>[:child, 3]) }
    }
  end