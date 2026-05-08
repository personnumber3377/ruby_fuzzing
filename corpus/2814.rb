do |x|
        f.write x
        f.write ' '
        f.pos -= 1
        expected << x
        assert_nothing_raised(bug6487) {result = File.read(f.path, mode: 'rb:bom|utf-8')}
        assert_equal("#{expected} ".force_encoding("utf-8"), result)
      end