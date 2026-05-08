do |script|
      dir, base = File.split(script.path)
      File.write(script, "abort ':run'\n")
      opts = ['-C', dir, '-r', "./#{base}", *opt]
      _, e = assert_in_out_err([*opts, '-ep'], "", //, test_stderr)
      stderr.concat(e) if e
      stderr << "---"
      _, e = assert_in_out_err([*opts, base], "", //, test_stderr)
      stderr.concat(e) if e
    end