dosn't work well in assert_separately even with __FILE__ and __LINE__
    assert_separately([ENV_ENABLE_BOX], __FILE__, __LINE__, "here = '#{__dir__}'; #{<<~"begin;"}\n#{<<~'end