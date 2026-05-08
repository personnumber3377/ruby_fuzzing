do |sym|
      assert_nothing_raised(TypeError, sym, bug11086) {
        sym.instance_exec {}
      }
      assert_raise(TypeError, sym, bug11086) {
        sym.instance_exec {def foo; end