do |dir|
        Dir.mkdir('test')
        assert_in_out_err(["-e", "", "test/*"], "", [], [], bug10941)
      end