do |code|
      exc = code[/\A[A-Z]\w+/] || 'RuntimeError'
      assert_separately([], <<-SRC)
      $VERBOSE = nil
      class ::Object
        def method_missing(m, *a, &b)
          raise #{code}
        end