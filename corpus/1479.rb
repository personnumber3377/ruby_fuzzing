do |f|
      f.lazy.each("").map do |paragraph|
        paragraph[/\A\s*(.*)/, 1]
      end