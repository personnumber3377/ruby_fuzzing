doc:
  def find_subtree_rec(obj, &b)
    if obj.respond_to? :to_ary
      s = Sentence.new(obj)
      if b.call s
        return s
      else
        obj.each {|e|
          r = find_subtree_rec(e, &b)
          return r if r
        }
      end