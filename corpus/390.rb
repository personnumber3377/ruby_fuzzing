dows? || Encoding.find('locale') == Encoding::UTF_8

  def test_execopts_open_failure
    with_tmpchdir {|d|
      assert_raise_with_message(Errno::ENOENT, %r"d/notexist") {
        Process.wait Process.spawn(*PWD, :in => "d/notexist")
      }
      assert_raise_with_message(Errno::ENOENT, %r"d/notexist") {
        Process.wait Process.spawn(*PWD, :out => "d/notexist")
      }
      n = "d/\u{1F37A}"
      assert_raise_with_message(Errno::ENOENT, /#{n}/) {
        Process.wait Process.spawn(*PWD, :in => n)
      }
      assert_raise_with_message(Errno::ENOENT, /#{n}/) {
        Process.wait Process.spawn(*PWD, :out => n)
      }
    }
  end