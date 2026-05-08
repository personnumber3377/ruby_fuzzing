do |dir|
      File.write(File.join(dir, "script_lines.rb"), "SCRIPT_LINES__ = {}\n")
      assert_in_out_err(%w"-r./script_lines -w -Ke", "puts __ENCODING__.name",
                        %w"EUC-JP", /-K is specified/, chdir: dir)
    end