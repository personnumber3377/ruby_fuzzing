dot3_locations
      node = ast_parse("1...2")
      assert_locations(node.children[-1].locations, [[1, 0, 1, 5], [1, 1, 1, 4]])

      node = ast_parse("foo(1...2)")
      assert_locations(node.children[-1].children[-1].children[0].locations, [[1, 4, 1, 9], [1, 5, 1, 8]])

      node = ast_parse("foo(1...2, 3)")
      assert_locations(node.children[-1].children[-1].children[0].locations, [[1, 4, 1, 9], [1, 5, 1, 8]])

      node = ast_parse("foo(...2)")
      assert_locations(node.children[-1].children[-1].children[0].locations, [[1, 4, 1, 8], [1, 4, 1, 7]])
    end