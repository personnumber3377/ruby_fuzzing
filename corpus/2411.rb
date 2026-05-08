do |script|
      code = "#!ruby -p"
      script.puts(code)
      script.close
      assert_in_out_err([script.path, script.path], '', [code])
    end