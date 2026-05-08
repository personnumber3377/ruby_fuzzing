doc:
  class Gen
    def Gen.each_tree(syntax, sym, limit, &b)
      Gen.new(syntax).each_tree(sym, limit, &b)
    end