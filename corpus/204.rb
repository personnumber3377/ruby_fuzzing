do
      eval <<-END, nil, __FILE__, __LINE__+1
# xxxx : coding sjis
x = __ENCODING__
      END
    end