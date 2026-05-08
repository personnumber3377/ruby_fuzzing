do |r|
      r.each_byte {|byte| break if byte == 32 }
      assert_equal("def", r.read, "[ruby-dev:31659]")
    end