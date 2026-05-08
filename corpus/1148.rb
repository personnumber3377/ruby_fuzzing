do
      Module.new {
        refine(String, &Proc.new {})
      }
    end