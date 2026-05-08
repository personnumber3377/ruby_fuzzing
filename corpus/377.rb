do
    n = 11928
    v = nil
    i = 0
    while i < n
      i += 1
      v = (foo rescue $!).local_variables
    end