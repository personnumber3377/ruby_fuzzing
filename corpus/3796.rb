do
      all_assertions_foreach(nil, *Dir["{lib,ext}/**/*.gemspec"]) do |src|
        specs += 1
        assert_kind_of(Gem::Specification, self.class.load(src), "invalid spec in #{src}")
      end