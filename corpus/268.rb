do
      $VERBOSE, verbose_bak = nil, $VERBOSE
      begin
        RubyVM::AbstractSyntaxTree.parse(code)
      ensure
        $VERBOSE = verbose_bak
      end