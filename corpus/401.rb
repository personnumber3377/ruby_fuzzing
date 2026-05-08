dout and stderr is not supported" if windows?
    with_tmpchdir {|d|
      with_pipe {|r, w|
        IO.popen([RUBY, '-e', 'IO.new(3, "w").puts("a"); puts "b"', 3=>w]) {|io|
          assert_equal("b\n", io.read)
        }
        w.close
        assert_equal("a\n", r.read)
      }
      IO.popen([RUBY, '-e', "IO.new(9, 'w').puts(:b)",
               9=>["out2", File::WRONLY|File::CREAT|File::TRUNC]]) {|io|
        assert_equal("", io.read)
      }
      assert_equal("b\n", File.read("out2"))
    }
  end