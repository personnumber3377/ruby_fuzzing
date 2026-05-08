docs.ruby-lang.org/en/(master|\d\.\d)/Ruby/Box.html for known issues, etc.}
  ]
  ENV_ENABLE_BOX = {'RUBY_BOX' => '1', 'TEST_DIR' => __dir__}

  def setup
    @box = nil
    @dir = __dir__
  end