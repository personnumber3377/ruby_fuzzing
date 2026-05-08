do
      eval <<-END, nil, __FILE__, __LINE__+1
        a = t.` "zzz"
        1.times {|;z| t.` ("zzz") }
      END
      t.instance_eval <<-END, __FILE__, __LINE__+1
        b = `zzz`
        c = %x(ccc)
      END
    end