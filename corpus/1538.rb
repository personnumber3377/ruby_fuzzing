do_block
    assert_error_tolerant(<<~STR, <<~EXP)
      m 1 do
        a
    STR
      (SCOPE@1:0-2:3
       tbl: []
       args: nil
       body:
         (ITER@1:0-2:3 (FCALL@1:0-1:3 :m (LIST@1:2-1:3 (INTEGER@1:2-1:3 1) nil))
            (SCOPE@1:4-2:3 tbl: [] args: nil body: (VCALL@2:2-2:3 :a))))
    EXP
  end