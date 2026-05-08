do |type|
      methods = []
      tp = TracePoint.new(type) { |tp| methods << tp.method_id }
      tp.enable do
        x = "a"; x = -x
        [1].max
        [1].min
        x = 42 + 2
        x = 42 - 2
        x = 42 * 2
        x = 42 / 2
        x = 42 % 2
        y = x == 42
        y = x < 42
        y = x <= 42
        y = x > 42
        y = x >= 42
        x = x << 1
        x = x & 1
        x = x | 1
        x = []; x[1]
        x[1] = 2
        x.length
        x.empty?
        x.nil?
        x = 1; x.succ
        !x
        x = 'a'; x =~ /a/
        x = y
      end