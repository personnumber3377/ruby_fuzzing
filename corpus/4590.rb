dom.new(42)
      body = Tempfile.new("ruby-bug", binmode: true)
      body.write(rng.bytes(16_385))
      body.rewind

      payload = []
      IO.copy_stream(body, dst_class.new{payload << it})
      body.rewind
      assert_equal(body.read, payload.join, bug21131)
    ensure
      body&.close
    end