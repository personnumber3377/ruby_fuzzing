do |dir|
        open(name, "w") {|f| f.puts "puts File.basename($0)"}
        assert_in_out_err([name], "", [expected], [],
                          bug10555, encoding: "locale")
      end