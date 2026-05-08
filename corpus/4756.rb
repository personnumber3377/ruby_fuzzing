do
      assert_not_nil(f = File.open('symbolic', 'w'))
      f.close
      assert_not_nil(f = File.open('numeric',  File::WRONLY|File::TRUNC|File::CREAT))
      f.close
      assert_not_nil(f = File.open('hash-symbolic', :mode => 'w'))
      f.close
      assert_not_nil(f = File.open('hash-numeric', :mode => File::WRONLY|File::TRUNC|File::CREAT), feature4742)
      f.close
      assert_nothing_raised(bug6055) {f = File.open('hash-symbolic', binmode: true)}
      f.close
    end