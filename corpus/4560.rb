do
          f.each_byte {|c| f.close if c == 10}
        end