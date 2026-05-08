do
      TracePoint.new(:line){
        10.times{
          Thread.pass
        }
      }.enable do
        (1..10).map{
          Thread.new{
            1_000.times{|i|
              _a = i
            }
          }
        }.each{|th|
          th.join
        }
      end