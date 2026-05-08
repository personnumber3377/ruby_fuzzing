dout
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