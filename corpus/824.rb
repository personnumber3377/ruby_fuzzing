doc_with_concatenation
    bug11990 = '[ruby-core:72857] [Bug #11990] concatenated string should not be dedented'
    %w[eos "eos" 'eos'].each do |eos|
      assert_equal("x\n  y",
                   eval("<<~#{eos} '  y'\n  x\neos\n"),
                   "#{bug11990} with #{eos}")
    end