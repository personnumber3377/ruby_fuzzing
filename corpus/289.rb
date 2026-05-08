do
      assert_normal_exit %q{
        begin
          TracePoint.new(:c_return){|tp|
            raise
          }.enable{
            tap{ itself }
          }
        rescue
        end