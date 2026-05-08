doc:
  def subst_rec(obj, target, &b)
    if obj.respond_to? :to_ary
      a = []
      obj.each {|e| a << subst_rec(e, target, &b) }
      a
    elsif target === obj
      yield obj
    else
      obj
    end