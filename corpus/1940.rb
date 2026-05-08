do
      h = {}
      ObjectSpace.count_objects(h)
      prev_matches = h[:T_MATCH] || 0
      _md = /[A-Z]/.match('1') # no match
      ObjectSpace.count_objects(h)
      new_matches = h[:T_MATCH] || 0
      assert_equal prev_matches, new_matches, "Bug [#20104]"
    end