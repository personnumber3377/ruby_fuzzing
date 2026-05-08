do)), "", ["Syntax OK"], [])
    assert_in_out_err(%w(-cw -e !defined?(retry)), "", ["Syntax OK"], [])
    assert_in_out_err(%w(-cw -e !defined?(yield)), "", ["Syntax OK"], [])
    assert_in_out_err(%w(-n -cw -e break), "", ["Syntax OK"], [])
    assert_in_out_err(%w(-n -cw -e next), "", ["Syntax OK"], [])
    assert_in_out_err(%w(-n -cw -e redo), "", ["Syntax OK"], [])
  end