do
      x.transform_values! {|v|
        x.rehash if v == 1337
        v * 2
      }
    end