does_not_block_other_threads
    mkcdtmpdir do
      File.mkfifo("fifo")
    rescue NotImplementedError
    else
      assert_separately([], <<-'EOS')
        t1 = Thread.new {
          open("fifo", "r") {|r|
            r.read
          }
        }
        t2 = Thread.new {
          open("fifo", "w") {|w|
            w.write "foo"
          }
        }
        t1_value, _ = assert_join_threads([t1, t2])
        assert_equal("foo", t1_value)
      EOS
    end