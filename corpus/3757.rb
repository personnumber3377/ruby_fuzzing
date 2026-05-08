do |f|
      f.puts 'sleep'
      f.close

      assert_separately(["-", f.path], "#{<<~"begin;"}\n#{<<~'end