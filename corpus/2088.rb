doc:

  # returns a new sentence object which expands according to the condition
  # given by the block.
  #
  # The block is invoked for each subsentence.
  # The subsentences which the block returns true are
  # expanded into parent.
  #
  #  s = Sentence(%w[2 * 7], "+", %w[3 * 5])
  #  #=> #<Sentence: ("2" "*" "7") "+" ("3" "*" "5")>
  #
  #  s.expand { true }
  #  #=> #<Sentence: "2" "*" "7" "+" "3" "*" "5">
  #
  #  s.expand {|s| s[0] == "3" }
  #  #=> #<Sentence: (("2" "*" "7") "+" "3" "*" "5")>
  #
  def expand(&b) # :yield: sentence
    Sentence.new(expand_rec(@sent, &b))
  end