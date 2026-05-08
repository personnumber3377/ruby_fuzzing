do |r, w|
      assert_match(/^#<IO:fd \d+>$/, r.inspect)
      r.freeze
      assert_match(/^#<IO:fd \d+>$/, r.inspect)
    end