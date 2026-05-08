do
      a = [1] * 100
      b = a[4..-1]
      a.replace([1])
      b.freeze
      b.unshift("a")
    end