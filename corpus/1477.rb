do |f|
      f.each("").map do |paragraph|
        paragraph[/\A\s*(.*)/, 1]
      end