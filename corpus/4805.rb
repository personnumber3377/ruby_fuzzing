do
        Thread.pass until th.stop?
        th.raise(exc)
      end