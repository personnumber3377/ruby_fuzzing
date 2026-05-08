dom.rand(10000)}_#{Time.now}"
    assert_not_equal sym.to_sym.hash,
                     `#{ruby} -e 'puts #{sym.inspect}.to_sym.hash'`.to_i
  end