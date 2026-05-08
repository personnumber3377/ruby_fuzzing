do |r|
           r.ungetc(r.getc)
           assert_equal([[r],[],[]], IO.select([r], nil, nil, 1))
         end