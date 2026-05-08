does not get propagated inappropriately
  def test_block_given_within_iterator
    assert_equal(["b"], ["a", "b", "c"].grep(IterString.new("b")) {|s| s})
  end