do |e|
        r.set_encoding(Encoding::US_ASCII, e)
        wthr = Thread.new{ w.print(bug3534[0], "\n\n\n\n", bug3534[1], "\n") }
        assert_equal((bug3534[0]+"\n\n").encode(e), r.gets(""), bug3534[0])
        assert_equal((bug3534[1]+"\n").encode(e), r.gets(), bug3534[1])
        wthr.join
      end