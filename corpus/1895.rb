do |cat|
      value = Warning[cat]
      assert_include([true, false], value)

      enabled = EnvUtil.verbose_warning do
        Warning[cat] = true
        Warning.warn "#{cat} feature", category: cat
      end