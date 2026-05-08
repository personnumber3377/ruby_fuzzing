do
        puts "2:#{$!}"
        raise 'x' rescue nil
      end