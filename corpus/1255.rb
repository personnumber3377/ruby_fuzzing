do
      Module.new do
        refine Integer do
          import_methods Enumerable
        end