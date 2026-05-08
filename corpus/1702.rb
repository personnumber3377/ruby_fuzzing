do |dir|
        Dir.chdir(dir) do
          orig = %W"d\u{e9}tente x\u{304c 304e 3050 3052 3054}"
          orig.each do |o|
            Dir.mkdir(o)
            n = Dir.chdir(o) {File.expand_path(".")}
            pp.assert_equal(o, File.basename(n))
          end