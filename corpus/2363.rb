do
        define_method(:<=>) do |x|
          callcc {|c2| c ||= c2 }
          i += 1
          0
        end