do |f|
      paths = ['#{@t1.path}', '#{@t2.path}', '#{@t3.path}']
      {#
        ARGF.close
        ARGV.replace paths
        puts ARGF.read
      };
      assert_equal("1\n2\n3\n4\n5\n6\n", f.read)
    end