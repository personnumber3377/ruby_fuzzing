do |f|
      line = f.readline("def")
      assert_equal File.read(__FILE__)[/\A.*?def/m], line
    end