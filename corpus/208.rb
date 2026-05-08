do
      eval <<-END, nil, __FILE__, __LINE__+1
# coding = locale
x = __ENCODING__
      END
    end