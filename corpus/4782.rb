do |t|
      assert_raise(Errno::EEXIST){ open(t.path, File::WRONLY|File::CREAT, flags: File::EXCL){} }
      assert_raise(Errno::EEXIST){ open(t.path, 'w', flags: File::EXCL){} }
      assert_raise(Errno::EEXIST){ open(t.path, mode: 'w', flags: File::EXCL){} }
    end