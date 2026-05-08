do
      a.update(b) {|k, o, n|
        a.rehash
      }
    end