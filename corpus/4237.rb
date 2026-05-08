donly
    omit unless /darwin|linux/.match(RUBY_PLATFORM)

    assert_raise(ArgumentError) { GC.config(implementation: "somethingelse") }
  end