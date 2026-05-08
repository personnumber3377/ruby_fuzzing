do |enc|
      assert_raise(ArgumentError) {S("mypassword").crypt(S("aa".encode(enc)))}
      assert_raise(ArgumentError) {S("mypassword".encode(enc)).crypt(S("aa"))}
    end