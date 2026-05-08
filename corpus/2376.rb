down, :T_ARRAY) || 0, :>=, ARY_COUNT - 25)
      refute_empty($arys.keep_if { |o| ObjectSpace.dump(o).include?('"embedded":true') })
    end