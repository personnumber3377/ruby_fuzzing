do
      h.update({a: 10, b: 20}){ |key, v1, v2| key == :b && h.freeze; v2 }
    end