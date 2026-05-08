do |ex|
      out, err, status = EnvUtil.invoke_ruby(cmd.map {|s|["-e", "#{ex} {#{s}}"]}.flatten, "", true, true)
      assert_equal(["", "", 42], [out, err, status.exitstatus], "#{bug5218}: #{ex}")
    end