do |(opt1, freeze), (opt2, debug)|
      opt = opts + [opt1, opt2].compact
      err = !freeze ? [] : debug ? with_debug_pat : wo_debug_pat
      [
        ['"foo" << "bar"', err],
        ['"foo#{123}bar" << "bar"', []],
        ['+"foo#{123}bar" << "bar"', []],
        ['-"foo#{123}bar" << "bar"', wo_debug_pat],
      ].each do |code, expected|
        assert_in_out_err(opt, code, [], expected, "#{opt} #{code}")
      end