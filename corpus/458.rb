do |a|
      %w[Array String].each do |type|
        a.for(type) do
          assert_separately(['-', EnvUtil.rubybin], <<~"END;")
          class #{type}
            def to_hash
              raise "[Bug-12355]: #{type}#to_hash is called"
            end