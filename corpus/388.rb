do |d|
      File.write("#{d}/tmp_script.cmd", ": ;\n", perm: 0o755)
      assert_not_nil(pid = Process.spawn({"PATH" => d}, "tmp_script.cmd"), bug8004)
      wpid, st = Process.waitpid2(pid)
      assert_equal([pid, true], [wpid, st.success?], bug8004)
    end