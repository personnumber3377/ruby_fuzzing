down][:T_STRING], :>=, STR_COUNT - 25)
      refute_empty($ary.keep_if { |o| ObjectSpace.dump(o).include?('"embedded":true') })
    end