dows cannot remove the current directory with permission issues.
        system(RUBY, "--disable-gems", "-e", "Dir.chdir '..'; Dir.rmdir #{dir.dump}", err: File::NULL)
        system({"RUBYLIB"=>nil}, RUBY, "--disable-gems", "-e", "exit true")
        status = $?
      }
      assert_predicate(status, :success?, "[ruby-dev:38105]")
    }
  end