do |src|
      src = '#'+src+' '
      str = assert_nothing_raised(SyntaxError, "#{bug8375} #{src.dump}") do
        break eval('"'+src+'"')
      end