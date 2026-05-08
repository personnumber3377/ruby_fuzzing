do |tmpdir|
      path = "#{tmpdir}/test-#{bug}.rb"
      File.write(path, "C::#{bug} = __FILE__\n")
      assert_separately(%W[-I #{tmpdir}], "#{<<-"begin;"}\n#{<<-"end