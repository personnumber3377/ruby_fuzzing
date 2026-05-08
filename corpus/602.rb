do
        next unless it.is_a?(Array)
        expected_insns.delete(it.first)
      end