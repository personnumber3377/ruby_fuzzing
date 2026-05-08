      \
      TEXT
    end;
    assert_syntax_error("#{<<~"begin;"}\n#{<<~'end;'}", /can't find string "TEXT"/)
    begin;
      <<~TEXT
      \
      TEXT
    end;

    assert_equal("  TEXT\n", eval("<<~eos\n" "  \\\n" "TEXT\n" "eos\n"))
  end

  def test_lineno_after_heredoc
    bug7559 = '[ruby-dev:46737]'
    expected, _, actual = __LINE__, <<eom, __LINE__
    a
    b
    c
    d