don't keep
    RubyVM.keep_script_lines = false

    ast, iseq = *parse_and_compile

    lines = ast.script_lines
    assert_equal nil, lines

    lines = iseq.script_lines
    assert_equal nil, lines
    iseq.each_child{|child|
      assert_equal lines, child.script_lines
    }

  ensure
    RubyVM.keep_script_lines = prev_conf
  end