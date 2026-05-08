doc_cr
    %W[\r\n \n].each do |nl|
      assert_syntax_error("<<\"\r\"#{nl}\r#{nl}", /unterminated/, nil, "CR with #{nl.inspect}")
    end