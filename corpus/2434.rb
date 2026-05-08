do |dir|
        open(name, "w") {}
        assert_in_out_err(["-e", "puts ARGV", "?.txt"], "", [expected], [],
                          bug10555, encoding: "external")
      end