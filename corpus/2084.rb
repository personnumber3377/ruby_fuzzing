doc:

  # returns new sentence object which
  # _target_ is substituted by the block.
  #
  # Sentence#subst invokes <tt>target === string</tt> for each
  # string in the sentence.
  # The strings which === returns true are substituted by the block.
  # The block is invoked with the substituting string.
  #
  #  Sentence.new(%w[2 + 3]).subst("+") { "*" }
  #  #<Sentence: "2" "*" "3">
  #
  #  Sentence.new(%w[2 + 3]).subst(/\A\d+\z/) {|s| ((s.to_i)*2).to_s }
  #  #=> #<Sentence: "4" "+" "6">
  #
  def subst(target, &b) # :yield: string
    Sentence.new(subst_rec(@sent, target, &b))
  end