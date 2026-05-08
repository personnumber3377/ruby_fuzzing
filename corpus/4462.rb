do |subtest|
    test = $'
    ZONES.each_pair do |tzname, (abbr, utc_offset, abbr2, utc_offset2)|
      define_method("#{test}@#{tzname}") do
        tz = make_timezone(tzname, abbr, utc_offset, abbr2, utc_offset2)
        time_class = self.class::TIME_CLASS
        __send