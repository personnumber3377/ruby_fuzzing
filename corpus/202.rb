do
      eval <<-END, nil, __FILE__, __LINE__+1
# coding = utf-8
x = __ENCODING__
      END
    end