dom.rand(10000)}_#{Time.now}".to_sym
  ]

  def test_instance_eval
    bug11086 = '[ruby-core:68961] [Bug #11086]'
    SymbolsForEval.each do |sym|
      assert_nothing_raised(TypeError, sym, bug11086) {
        sym.instance_eval {}
      }
      assert_raise(TypeError, sym, bug11086) {
        sym.instance_eval {def foo; end