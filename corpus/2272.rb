do |a|
      asgn = %w'= +='
      asgn.product(asgn) do |a1, a2|
        stmt = "a #{a1} b #{a2} raise 'x'"
        a.for(stmt) {assert_valid_syntax(stmt)}
      end