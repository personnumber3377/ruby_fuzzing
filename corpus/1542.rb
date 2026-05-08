dot2_locations
      node = ast_parse("1..2")
      assert_locations(node.children[-1].locations, [[1, 0, 1, 4], [1, 1, 1, 3]])

      node = ast_parse("foo(1..2)")
      assert_locations(node.children[-1].children[-1].children[0].locations, [[1, 4, 1, 8], [1, 5, 1, 7]])

      node = ast_parse("foo(1..2, 3)")
      assert_locations(node.children[-1].children[-1].children[0].locations, [[1, 4, 1, 8], [1, 5, 1, 7]])

      node = ast_parse("foo(..2)")
      assert_locations(node.children[-1].children[-1].children[0].locations, [[1, 4, 1, 7], [1, 4, 1, 6]])
    end