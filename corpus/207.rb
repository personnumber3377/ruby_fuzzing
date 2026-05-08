do
      eval <<-END, nil, __FILE__, __LINE__+1
# coding = filesystem
x = __ENCODING__
      END
    end