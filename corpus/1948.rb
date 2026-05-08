do |age|
      pos, neg = UnicodeAgeRegexps[age]
      assert_match(pos, char, mesg)
      assert_not_match(neg, char, mesg)
    end