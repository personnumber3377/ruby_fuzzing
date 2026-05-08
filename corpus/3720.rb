do
    remove_const :TEST1  if defined? ::TestConst::TEST1
    remove_const :TEST2  if defined? ::TestConst::TEST2
    remove_const :Const  if defined? ::TestConst::Const
    remove_const :Const2 if defined? ::TestConst::Const2

    TEST1 = 1
    TEST2 = 2

    module Const
      TEST3 = 3
      TEST4 = 4
    end