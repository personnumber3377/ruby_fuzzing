does not affect $~"
    /.*/ =~ message
    md_before = $~
    assert_equal(expected, string.__send