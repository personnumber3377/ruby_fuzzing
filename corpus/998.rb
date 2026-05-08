dows_31J) do
      sjis_hash = "{\x87]: 1}".force_encoding('sjis')
      assert_equal(eval(sjis_hash).inspect, sjis_hash)
    end