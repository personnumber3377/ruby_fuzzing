dont_move_cursor_position
    bug6179 = '[ruby-core:43497]'
    with_tmpdir {
      str = "line one\r\nline two\r\nline three\r\n"
      generate_file("tmp", str)
      open("tmp", "r") do |f|
        assert_equal("line one\n", f.readline)
        assert_equal(10, f.pos, bug6179)
        assert_equal("line two\n", f.readline, bug6179)
        assert_equal(20, f.pos, bug6179)
        assert_equal("line three\n", f.readline, bug6179)
      end