doc_interpolation
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
      #{("/#{var}")}
    HEREDOC

    assert_equal "something\n/1\n", v1
    assert_equal "something\n/1\n", v2
    assert_equal "something\n/1\n", v3
    assert_equal v1, v2
    assert_equal v2, v3
    assert_equal v1, v3
  end