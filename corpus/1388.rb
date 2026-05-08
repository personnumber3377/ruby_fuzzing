do |i|
      assert_block('newline should be significant after pattern label') do
        bug18890.call(i)
      end