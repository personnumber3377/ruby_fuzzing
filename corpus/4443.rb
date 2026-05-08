do
      def method_missing(meth, *args) yield(meth, *args) end