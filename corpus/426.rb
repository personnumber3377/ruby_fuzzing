do |d|
      File.write("tmp_script.#{$$}", ": ;\n", perm: 0o755)
      assert_not_nil(pid = Process.spawn("./tmp_script.#{$$}"), feature)
      wpid, st = Process.waitpid2(pid)
      assert_equal([pid, true], [wpid, st.success?], feature)

      File.write("tmp_script.#{$$}", "echo $#: $@", perm: 0o755)
      result = IO.popen(["./tmp_script.#{$$}", "a b", "c"]) {|f| f.read}
      assert_equal("2: a b c\n", result, feature)

      File.write("tmp_script.#{$$}", "echo $hghg", perm: 0o755)
      result = IO.popen([{"hghg" => "mogomogo"}, "./tmp_script.#{$$}", "a b", "c"]) {|f| f.read}
      assert_equal("mogomogo\n", result, feature)

    end