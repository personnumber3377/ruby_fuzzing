do |e, v|
      @envs[e] = ENV.delete(e)
      ENV[e] = v if v
    end