do
        define_method(:<=>) do |x|
          callcc {|c2| c ||= c2 }
          0
        end