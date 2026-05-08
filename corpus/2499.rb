dom_ulong_limited_no_rand
    c = Class.new do
      undef rand
      def bytes(n)
        "\0"*n
      end