do
        result = execute(-> { yield 42 })
        p [:result, result]
      end