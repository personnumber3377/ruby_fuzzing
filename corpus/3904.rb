do
        h = {kw: 2}
        n.times{|i| h[i.to_s.to_sym] = i}
        def self.f(kw: 1, **kws) kws.size end