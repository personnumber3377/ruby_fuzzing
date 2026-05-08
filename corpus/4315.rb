do |t|
      assert_predicate t.value, :success?, '[ruby-core:85940] [Bug #14578]'
    end