do |i|
      assert_nothing_raised(IOError, "#{bug} trying ##{i}") do
        IO.popen(EnvUtil.rubybin, "r+") {|f|
          th = Thread.new {f.close_write}
          f.close_read
          th.join
        }
      end