do |dir|
      File.binwrite("#{dir}/x", "")
      File.chmod(0000, dir)
      next if File.readable?(dir)
      assert_warning(/#{dir}/) do
        Dir.glob("#{dir}/x")
      end