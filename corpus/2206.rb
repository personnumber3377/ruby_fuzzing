if (a, b = MyObj.new); [a, b]; end", nil, __FILE__, __LINE__)
    assert_equal [[1,2],[3,4]], result
  end

  def test_const_assign_order
    assert_raise(RuntimeError) do
      eval('raise("recv