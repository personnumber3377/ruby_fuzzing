doc:
  def inner_inspect(ary, r)
    first = true
    ary.each {|obj|
      r << ' ' if !first
      first = false
      if obj.respond_to? :to_ary
        r << '('
        inner_inspect(obj, r)
        r << ')'
      else
        r << obj.inspect
      end