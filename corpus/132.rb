def t(e = false);raise if e; __LINE__;end", "test", -100)
    assert_equal(-100, obj.t, bug)
    assert_equal(-100, obj.method(:t).source_location[1], bug)
    e = assert_raise(RuntimeError) {obj.t(true)}
    assert_equal(-100, e.backtrace_locations.first.lineno, bug)
  end

  def test_file_in_indented_heredoc
    name = '[ruby-core:80987] [Bug #13540]' # long enough to be shared
    assert_equal(name+"\n", eval("#{<<-"begin;"}\n#{<<-'end;'}", nil, name))
    begin;
      <<~HEREDOC
        #{__FILE__}
      HEREDOC
    end;
  end

  def test_heredoc_interpolation
    var = 1

    v1 = <<~HEREDOC
      something
      #{"/#{var}"}
    HEREDOC

    v2 = <<~HEREDOC
      something
      #{_other = "/#{var}"}
    HEREDOC

    v3 = <<~HEREDOC
      something
      #{("/#{var}