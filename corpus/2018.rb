do |dirname|
        longest_possible_component = "b" * 255
        long_path = File.join(dirname, longest_possible_component)
        Dir.mkdir(long_path)
        File.write("#{long_path}/c", "")
        assert_equal(%w[c], Dir.children(long_path))
      ensure
        File.unlink("#{long_path}/c")
        Dir.rmdir(long_path)
      end