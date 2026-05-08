do
        p = Proc.new{return :b}
        p.call
      end