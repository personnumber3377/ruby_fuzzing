doit)", bug9978, limit: 2.0)
        ENV.clear
        k = 'FOO'
        (ENV[k] = 'bar'*5000 rescue 'bar'*1500)
        doit = proc {ENV.select {break}}
        500.times(&doit)
      end