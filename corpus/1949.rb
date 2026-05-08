do |age|
      pos, neg = UnicodeAgeRegexps[age]
      assert_not_match(pos, char, mesg)
      assert_match(neg, char, mesg)
    end