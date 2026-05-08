do), "", [], [:*, /(-e:1:|~) Invalid redo/, :*])
    assert_in_out_err(%w(-cw -e retry), "", [], [:*, /(-e:1:|~) Invalid retry/, :*])
    assert_in_out_err(%w(-cw -e yield), "", [], [:*, /(-e:1:|~) Invalid yield/, :*])
    assert_in_out_err(%w(-cw -e begin -e break -e end