do |dir|
        Ougai.each {|f| open(f, "w") {}}
        assert_in_out_err(["-Eutf-8", "-e", "puts ARGV", "*"], "", Ougai, encoding: "utf-8")
        ougai = Ougai.map {|f| f.encode("external", replace: "?")}
        assert_in_out_err(["-e", "puts ARGV", "*.txt"], "", ougai)
      end