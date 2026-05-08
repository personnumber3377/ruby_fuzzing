downcase![0])
    assert_equal("ABC", "abc".tr!("a-z", "A-Z"))
    assert_equal("ABC", "aabbcccc".tr_s!("a-z", "A-Z"))
    assert_equal("abc", "abcc".squeeze!("a-z"))
    assert_equal("ad", "abcd".delete!("bc"))

    x = "abcdef"
    y = [ ?a, ?b, ?c, ?d, ?e, ?f ]
    bad = false
    x.each_byte {|i|
      if i.chr != y.shift
        bad = true
        break
      end