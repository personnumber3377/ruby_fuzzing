do |forbid|
      ary.define_singleton_method(forbid){ fail "#{forbid} was called"}
    end