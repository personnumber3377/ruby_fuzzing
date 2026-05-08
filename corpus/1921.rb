%r#{c}\\#{c}#{c}", nil, __FILE__, __LINE__)
          t = eval("/\\#{c}/", nil, __FILE__, __LINE__).source
        rescue SyntaxError => e
          [e, t, nil]
        else
          [re.source, t, re =~ "a#{c}a"]
        end
      ]
    }.transpose
    assert_equal(expected, result)
  end

  def test_source_escaped_paren
    bug7610 = '[ruby-core:51088] [Bug #7610]'
    bug8133 = '[ruby-core:53578] [Bug #8133]'
    [
     ["(", 