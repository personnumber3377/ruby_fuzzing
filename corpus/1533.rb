does not reproduce.
    # The bug occurred only if SCRIPT_LINES__ included __FILE__ as a key.
    lines = [
      "SCRIPT_LINES__ = {__FILE__ => []}",
      "puts RubyVM::AbstractSyntaxTree.of(->{ 1 + 2 }, keep_script_lines: true).script_lines",
      "p SCRIPT_LINES__"
    ]
    test_stdout = lines + ['{"-e" => []}']
    assert_in_out_err(["-e", lines.join("\n")], "", test_stdout, [])
  end