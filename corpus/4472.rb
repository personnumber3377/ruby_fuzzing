do |dir|
      File.binwrite("#{dir}/x", "")
      File.chmod(0300, dir)
      next if File.readable?(dir)
      assert_warning(/#{dir}/) do
        Dir.glob("#{dir}/*")
      end