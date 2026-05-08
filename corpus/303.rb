do
    assert_consistent_call_return '[Bug #9964]' do
      i = 0
      1.times{
        break if (i+=1) > 10
        redo
      }
    end