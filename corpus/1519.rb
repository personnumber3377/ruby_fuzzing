do",
    ].each do |code, *args|
      msg = /Invalid #{code[/\A\w+/]}/
      assert_parse("while false; #{code}; end