do |category, level|
      assert_in_out_err(["-W:#{category}", "-e", "p Warning[:#{category}]"], "", %w(true), [])
      assert_in_out_err(["-W:no-#{category}", "-e", "p Warning[:#{category}]"], "", %w(false), [])
      assert_in_out_err(["-e", "p Warning[:#{category}]"], "", level > 0 ? %w(false) : %w(true), [])
      assert_in_out_err(["-w", "-e", "p Warning[:#{category}]"], "", level > 1 ? %w(false) : %w(true), [])
      assert_in_out_err(["-W", "-e", "p Warning[:#{category}]"], "", level > 1 ? %w(false) : %w(true), [])
      assert_in_out_err(["-We", "p Warning[:#{category}]"], "", level > 1 ? %w(false) : %w(true), [])
    end