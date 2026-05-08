          STDOUT.puts "abc"
          STDOUT.flush
          STDERR.puts "def"
          STDERR.flush
        EOS
        in_w.close
        Process.wait pid
        assert_equal "abc\r\ndef\r\n", out_r.binmode.read
        out_r.close
      end
    end
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_cr_decorator_on_stdout
    with_pipe do |in_r, in_w|
      with_pipe do |out_r, out_w|
        pid = Process.spawn({}, EnvUtil.rubybin, in: in_r, out: out_w)
        in_r.close
        out_w.close
        in_w.write <<-EOS
          STDOUT.set_encoding('locale', nil, newline: :cr)
          STDOUT.puts "abc"
          STDOUT.flush
        EOS
        in_w.close
        Process.wait pid
        assert_equal "abc\r", out_r.binmode.read
        out_r.close
      end
    end
  end

  def test_lf_decorator_on_stdout
    with_pipe do |in_r, in_w|
      with_pipe do |out_r, out_w|
        pid = Process.spawn({}, EnvUtil.rubybin, in: in_r, out: out_w)
        in_r.close
        out_w.close
        in_w.write <<-EOS
          STDOUT.set_encoding('locale', nil, newline: :lf)
          STDOUT.puts "abc"
          STDOUT.flush
        EOS
        in_w.close
        Process.wait pid
        assert_equal "abc\n", out_r.binmode.read
        out_r.close
      end
    end
  end

  def test_crlf_decorator_on_stdout
    with_pipe do |in_r, in_w|
      with_pipe do |out_r, out_w|
        pid = Process.spawn({}, EnvUtil.rubybin, in: in_r, out: out_w)
        in_r.close
        out_w.close
        in_w.write <<-EOS
          STDOUT.set_encoding('locale', nil, newline: :crlf)
          STDOUT.puts "abc"
          STDOUT.flush
        EOS
        in_w.close
        Process.wait pid
        assert_equal "abc\r\n", out_r.binmode.read
        out_r.close
      end
    end
  end

  def test_binmode_with_pipe
    with_pipe do |r, w|
      src = "a\r\nb\r\nc\r\n"
      w.binmode.write src
      w.close

      assert_equal("a", r.getc)
      assert_equal("\n", r.getc)
      r.binmode
      assert_equal("b", r.getc)
      assert_equal("\r", r.getc)
      assert_equal("\n", r.getc)
      assert_equal("c", r.getc)
      assert_equal("\r", r.getc)
      assert_equal("\n", r.getc)
      assert_equal(nil, r.getc)
      r.close
    end
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_stdin_binmode
    with_pipe do |in_r, in_w|
      with_pipe do |out_r, out_w|
        pid = Process.spawn({}, EnvUtil.rubybin, '-e', <<-'End', in: in_r, out: out_w)
          STDOUT.binmode
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDIN.binmode
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
        End
        in_r.close
        out_w.close
        src = "a\r\nb\r\nc\r\n"
        in_w.binmode.write src
        in_w.close
        Process.wait pid
        assert_equal "a\nb\r\nc\r\n", out_r.binmode.read
        out_r.close
      end
    end
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_read_with_length
    with_tmpdir {
      str = "a\nb"
      generate_file("tmp", str)
      open("tmp", "r") do |f|
        assert_equal(str, f.read(3))
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_read_with_length_binmode
    with_tmpdir {
      str = "a\r\nb\r\nc\r\n\r\n"
      generate_file("tmp", str)
      open("tmp", "r") do |f|
        # read with length should be binary mode
        assert_equal("a\r\n", f.read(3)) # binary
        assert_equal("b\nc\n\n", f.read) # text
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_gets_and_read_with_binmode
    with_tmpdir {
      str = "a\r\nb\r\nc\r\n\n\r\n"
      generate_file("tmp", str)
      open("tmp", "r") do |f|
        assert_equal("a\n", f.gets)      # text
        assert_equal("b\r\n", f.read(3)) # binary
        assert_equal("c\r\n", f.read(3)) # binary
        assert_equal("\n\n", f.read)     # text
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_getc_and_read_with_binmode
    with_tmpdir {
      str = "a\r\nb\r\nc\n\n\r\n\r\n"
      generate_file("tmp", str)
      open("tmp", "r") do |f|
        assert_equal("a", f.getc)         # text
        assert_equal("\n", f.getc)        # text
        assert_equal("b\r\n", f.read(3))  # binary
        assert_equal("c\n\n\n\n", f.read) # text
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_read_with_binmode_and_gets
    with_tmpdir {
      str = "a\r\nb\r\nc\r\n\r\n"
      open("tmp", "wb") { |f| f.write str }
      open("tmp", "r") do |f|
        assert_equal("a", f.getc)         # text
        assert_equal("\n", f.getc)        # text
        assert_equal("b\r\n", f.read(3))  # binary
        assert_equal("c\n", f.gets)       # text
        assert_equal("\n", f.gets)        # text
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_read_with_binmode_and_getc
    with_tmpdir {
      str = "a\r\nb\r\nc\r\n\r\n"
      open("tmp", "wb") { |f| f.write str }
      open("tmp", "r") do |f|
        assert_equal("a", f.getc)         # text
        assert_equal("\n", f.getc)        # text
        assert_equal("b\r\n", f.read(3))  # binary
        assert_equal("c", f.getc)         # text
        assert_equal("\n", f.getc)        # text
        assert_equal("\n", f.getc)        # text
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_read_write_with_binmode
    with_tmpdir {
      str = "a\r\n"
      generate_file("tmp", str)
      open("tmp", "r+") do |f|
        assert_equal("a\r\n", f.read(3))  # binary
        f.write("b\n\n");                 # text
        f.rewind
        assert_equal("a\nb\n\n", f.read)  # text
        f.rewind
        assert_equal("a\r\nb\r\n\r\n", f.binmode.read) # binary
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_seek_with_setting_binmode
    with_tmpdir {
      str = "a\r\nb\r\nc\r\n\r\n\n\n\n\n\n\n\n"
      generate_file("tmp", str)
      open("tmp", "r") do |f|
        assert_equal("a\n", f.gets)      # text
        assert_equal("b\r\n", f.read(3)) # binary
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_error_nonascii
    bug6071 = '[ruby-dev:45279]'
    paths = ["\u{3042}".encode("sjis"), "\u{ff}".encode("iso-8859-1")]
    encs = with_tmpdir {
      paths.map {|path|
        open(path) rescue $!.message.encoding
      }
    }
    assert_equal(paths.map(&:encoding), encs, bug6071)
  end

  def test_inspect_nonascii
    bug6072 = '[ruby-dev:45280]'
    paths = ["\u{3042}".encode("sjis"), "\u{ff}".encode("iso-8859-1")]
    encs = with_tmpdir {
      paths.map {|path|
        open(path, "wb") {|f| f.inspect.encoding}
      }
    }
    assert_equal(paths.map(&:encoding), encs, bug6072)
  end

  def test_pos_dont_move_cursor_position
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
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_pos_with_buffer_end_cr
    bug6401 = '[ruby-core:44874]'
    with_tmpdir {
      # Read buffer size is 8192. This generates '\r' at 8192.
      lines = ["X" * 8188, "X"]
      generate_file("tmp", lines.join("\r\n") + "\r\n")

      open("tmp", "r") do |f|
        lines.each do |line|
          f.pos
          assert_equal(line, f.readline.chomp, bug6401)
        end
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_read_crlf_and_eof
    bug6271 = '[ruby-core:44189]'
    with_tmpdir {
      str = "a\r\nb\r\nc\r\n"
      generate_file("tmp", str)
      open("tmp", "r") do |f|
        i = 0
        until f.eof?
          assert_equal(str[i], f.read(1), bug6271)
          i += 1
        end
        assert_equal(str.size, i, bug6271)
      end
    }
  end if /mswin|mingw/ =~ RUBY_PLATFORM

  def test_read_with_buf_broken_ascii_only
    a, b = IO.pipe
    a.binmode
    b.binmode
    b.write("\xE2\x9C\x93")
    b.close

    buf = "".force_encoding("binary")
    assert buf.ascii_only?, "should have been ascii_only?"
    a.read(1, buf)
    assert !buf.ascii_only?, "should not have been ascii_only?"
  ensure
    a.close rescue nil
    b.close rescue nil
  end

  def test_each_codepoint_need_more
    bug11444 = '[ruby-core:70379] [Bug #11444]'
    tests = [
      ["incomplete multibyte", "\u{1f376}".b[0,3], [], ["invalid byte sequence in UTF-8"]],
      ["multibyte at boundary", "x"*8190+"\u{1f376}", ["1f376"], []],
    ]
    failure = []
    ["bin", "text"].product(tests) do |mode, (test, data, out, err)|
      code = <<-"end;"
        c = nil
        begin
          open(ARGV[0], "r#{mode[0]}:utf-8") do |f|
            f.each_codepoint{|i| c = i}
          end
        rescue ArgumentError => e
          STDERR.puts e.message
        else
          printf "%x", c
        end
      end;
      Tempfile.create("codepoint") do |f|
        args = ['-e', code, f.path]
        f.print data
        f.close
        begin
          assert_in_out_err(args, "", out, err,
                            "#{bug11444}: #{test} in #{mode} mode",
                            timeout: 10)
        rescue Exception => e
          failure << e
        end
      end
    end
    unless failure.empty?
      flunk failure.join("\n---\n")
    end
  end

  def test_each_codepoint_encoding_with_ungetc
    File.open(File::NULL, "rt:utf-8") do |f|
      f.ungetc(%Q[\u{3042}\u{3044}\u{3046}])
      assert_equal [0x3042, 0x3044, 0x3046], f.each_codepoint.to_a
    end
    File.open(File::NULL, "rt:us-ascii") do |f|
      f.ungetc(%Q[\u{3042}\u{3044}\u{3046}])
      assert_raise(ArgumentError) do
        f.each_codepoint.to_a
      end
    end
  end