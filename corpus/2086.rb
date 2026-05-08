doc:

  # find a subsentence and return it.
  # The block is invoked for each subsentence in preorder manner.
  # The first subsentence which the block returns true is returned.
  #
  #  Sentence(%w[2 * 7], "+", %w[3 * 5]).find_subtree {|s| s[1] == "*" }
  #  #=> #<Sentence: "2" "*" "7">
  #
  def find_subtree(&b) # :yield: sentence
    find_subtree_rec(@sent, &b)
  end