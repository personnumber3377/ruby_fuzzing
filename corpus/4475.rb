do
      open(name, "w") {} rescue next
      match, = Dir.glob("#{name}*")
      next unless match and match.encoding == Encoding::Shift_JIS
      assert_equal([name], Dir.glob("\\#{name}*"))
    end