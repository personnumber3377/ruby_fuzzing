dom: gen)}

    bug7935 = '[ruby-core:52779] [Bug #7935]'
    class << (gen = Object.new)
      def rand(limit) @limit = limit; 0 end