do |f|
      line = f.readline("def", chomp: true)
      assert_equal File.read(__FILE__)[/\A.*?(?=def)/m], line
    end