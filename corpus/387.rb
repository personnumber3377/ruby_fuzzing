do |k|
      case k
      when /\APATH\z/i
      when *MANDATORY_ENVS
        cmd << '-e' << "ENV.delete('#{k}')"
      else
        h[k] = nil
      end