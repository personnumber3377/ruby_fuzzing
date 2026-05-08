dot].each do |tmp|
      tmp = File.join(a, tmp)
      open(tmp, "w") {}
      assert_not_send