do |e|
      assert_raise(TypeError) { e.dup }
      assert_raise(TypeError) { e.clone }
      assert_same(e, Marshal.load(Marshal.dump(e)))
    end