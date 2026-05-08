doc:
  def expand_rec(obj, r=[], &b)
    if obj.respond_to? :to_ary
      obj.each {|o|
        s = Sentence.new(o)
        if b.call s
          expand_rec(o, r, &b)
        else
          a = []
          expand_rec(o, a, &b)
          r << a
        end