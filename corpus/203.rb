do
      eval <<-END, nil, __FILE__, __LINE__+1
# coding = foobarbazquxquux_dummy_enconding
x = __ENCODING__
      END
    end