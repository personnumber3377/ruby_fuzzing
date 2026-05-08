do
        p = Proc.new{return :a}
        p.call
      end