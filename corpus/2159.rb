do
    remove_const :MethodInMethodClass if defined? MethodInMethodClass

    class MethodInMethodClass
      def m1
        def m2
        end