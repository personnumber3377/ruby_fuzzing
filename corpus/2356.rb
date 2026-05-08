dog"=>1}, hash)
    assert_equal([[1, 0], [[1, 2], 1]], Foo.new.each_with_index.to_a)
  end