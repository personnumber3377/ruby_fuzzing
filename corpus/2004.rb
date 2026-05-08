do
      bug19042 = '[ruby-core:110220] [Bug #19042]'
      %w"c/dir_a c/dir_b c/dir_b/dir".each do |d|
        Dir.mkdir(d)
      end