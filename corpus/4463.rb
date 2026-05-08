do |subtest|
    test = $'
    ZONES.each_pair do |tzname, (abbr, utc_offset)|
      define_method("#{test}@#{tzname}") do
        time_class = self.class::TIME_CLASS
        __send