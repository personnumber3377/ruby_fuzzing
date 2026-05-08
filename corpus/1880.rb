do |outs, errs, status|
      begin;
        exc = Class.new(StandardError) do
          def initialize(obj, cnt)
            super(obj)
            @errcnt = cnt
          end