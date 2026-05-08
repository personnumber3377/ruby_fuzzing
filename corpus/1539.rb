do_LAMBDA
    assert_error_tolerant(<<~STR, <<~EXP)
      -> do
        a
    STR
      (SCOPE@1:0-2:3
       tbl: []
       args: nil
       body:
         (LAMBDA@1:0-2:3
            (SCOPE@1:0-2:3
             tbl: []
             args:
               (ARGS@1:2-1:2
                pre_num: 0
                pre_init: nil
                opt: nil
                first_post: nil
                post_num: 0
                post_init: nil
                rest: nil
                kw: nil
                kwrest: nil
                block: nil)
             body: (VCALL@2:2-2:3 :a))))
    EXP
  end