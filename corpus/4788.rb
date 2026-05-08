do |t|
      assert_raise(Errno::EEXIST){ open(t.path, 'wx'){} }
      assert_raise(ArgumentError){ open(t.path, 'rx'){} }
      assert_raise(ArgumentError){ open(t.path, 'ax'){} }
    end