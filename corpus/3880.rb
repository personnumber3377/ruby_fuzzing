do |o1, o2=42, *args, p, k: :key, **kw, &b|
      [o1, o2, args, p, k, kw, b]
    end