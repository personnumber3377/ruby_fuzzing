do
          f.each_codepoint {|c| f.close if c == 10}
        end