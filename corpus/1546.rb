do_locations
      node = ast_parse("loop { redo }")
      assert_locations(node.children[-1].children[-1].children[-1].locations, [[1, 7, 1, 11], [1, 7, 1, 11]])
    end