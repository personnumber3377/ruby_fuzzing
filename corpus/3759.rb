do |tmp|
      provide = File.realdirpath("provide.rb", tmp)
      File.write(File.join(tmp, "target.rb"), "raise __FILE__\n")
      File.write(provide, '$" << '"'target.rb'\n")
      $:.replace([tmp])
      assert(require("provide"))
      assert(!require("target"))
      assert_equal($".pop, provide)
      assert_equal($".pop, "target.rb")
    end