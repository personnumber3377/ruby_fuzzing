do |f|
      line = f.readline(chomp: true)
      assert_equal File.readlines(__FILE__).first.chomp, line
    end