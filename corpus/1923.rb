%r#{c}\\#{c}#{c}", nil, __FILE__, __LINE__)
          t = eval("%r{\\#{c}}", nil, __FILE__, __LINE__).source
        rescue SyntaxError => e
          [e, t, nil]
        else
          [re.source, t, re =~ "a#{c}a"]
        end
      ]
    }.transpose
    assert_equal(expected, result)
  end

  def test_inspect
    assert_equal('//', //.inspect)
    assert_equal('//i', //i.inspect)
    assert_equal('/\//i', /\//i.inspect)
    assert_equal('/\//i', %r"#{'/'}"i.inspect)
    assert_equal('/\/x/i', /\/x/i.inspect)
    assert_equal('/\x00/i', /#{"\0"}/i.inspect)
    assert_equal("/\n/i", /#{"\n"}/i.inspect)
    s = [0xf1, 0xf2, 0xf3].pack("C*