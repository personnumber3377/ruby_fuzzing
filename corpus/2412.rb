do |script|
      script.puts("#!ruby -s")
      script.puts("p $abc")
      script.close
      assert_in_out_err([script.path, "-abc=foo"], '', ['"foo"'])
    end