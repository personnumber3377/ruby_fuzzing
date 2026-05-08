do
        sleep #{t}
        t2.kill
        t2.join
      end