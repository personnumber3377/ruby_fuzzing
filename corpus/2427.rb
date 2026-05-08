do |stdin, stdout, status|
      assert_equal(["#{File.basename(EnvUtil.rubybin)}:-e:#{status.pid}"], stdin)
    end