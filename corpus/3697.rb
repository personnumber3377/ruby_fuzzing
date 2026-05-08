doit)", bug9983, limit: 2.0)
        ENV.clear
        k = 'FOO'
        v = (ENV[k] = 'bar'*5000 rescue 'bar'*1500)
        doit = proc {ENV[k] = v; ENV.shift}
        500.times(&doit)
      end