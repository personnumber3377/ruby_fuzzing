do
      o.instance_eval <<-END, __FILE__, __LINE__+1
        undef >, /
      END
    end