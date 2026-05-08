do |op|
        if missed_insns.include?(op)
          # This instruction was compiled
          missed_insns.delete(op)
        end