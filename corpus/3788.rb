do |len|
      ["", *".0"..".9"].each do |prec|
        ['', '+', '-', ' ', '0', '+0', '-0', ' 0', '+ ', '- ', '+ 0', '- 0'].each do |flags|
          fmt = "%#{flags}#{len}#{prec}f"
          [0, 0.1, 0.01, 0.001, 1.001, 100.0, 100.001, 10000000000.0, 0.00000000001, 1/3r, 2/3r, 1.2r, 10r].each do |num|
            assert_equal(sprintf(fmt, num.to_f), sprintf(fmt, num.to_r), "sprintf(#{fmt.inspect}, #{num.inspect}.to_r)")
            assert_equal(sprintf(fmt, -num.to_f), sprintf(fmt, -num.to_r), "sprintf(#{fmt.inspect}, #{(-num).inspect}.to_r)") if num > 0
          end