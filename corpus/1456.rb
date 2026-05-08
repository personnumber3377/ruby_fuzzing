do |foo, expect|
      assert_equal expect, eval("foo = #{foo.inspect}\n#{code}")
    end