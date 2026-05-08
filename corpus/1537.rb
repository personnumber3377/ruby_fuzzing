do
    assert_error_tolerant(<<~STR, <<~EXP)
      m do
        a
    STR
      (SCOPE@1:0-2:3
       tbl: []
       args: nil
       body:
         (ITER@1:0-2:3 (FCALL@1:0-1:1 :m nil)
            (SCOPE@1:2-2:3 tbl: [] args: nil body: (VCALL@2:2-2:3 :a))))
    EXP
  end