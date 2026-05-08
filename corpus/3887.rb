do
      break eval("proc {|m, a:| [m, a]}", nil, 'xyzzy', __LINE__)
    end