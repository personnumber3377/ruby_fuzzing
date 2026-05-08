dollar
    verbose_bak, $VERBOSE = $VERBOSE, nil
    # 4) :$- always treats next character literally:
    assert_raise(SyntaxError) {eval ':$-'}
    assert_raise(SyntaxError) {eval ":$-\n"}
    assert_raise(SyntaxError) {eval ":$- "}
    assert_raise(SyntaxError) {eval ":$-#"}
    assert_raise(SyntaxError) {eval ':$-('}
  ensure
    $VERBOSE = verbose_bak
  end