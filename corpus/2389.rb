            if __FILE__.encoding == __dir__.encoding
              p true
            else
              puts "__FILE__: \#{__FILE__.encoding}, __dir__: \#{__dir__.encoding}"
            end
          END
        end
        r, = EnvUtil.invoke_ruby([lang, "test.rb"], "", true)
        assert_equal "true", r.chomp, "the encoding of __FILE__ and __dir__ should be same"
      end
    end
  end

  def test_cwd_encoding
    with_tmpchdir do
      testdir = "\u30c6\u30b9\u30c8"
      Dir.mkdir(testdir)
      Dir.chdir(testdir) do
        File.write("a.rb", "require './b'")
        File.write("b.rb", "puts 'ok'")
        assert_ruby_status([{"RUBYLIB"=>"."}, *%w[-E cp932:utf-8 a.rb]])
      end
    end
  end

  def test_rubylib_invalid_encoding
    env = {"RUBYLIB"=>"\xFF", "LOCALE"=>"en_US.UTF-8", "LC_ALL"=>"en_US.UTF-8"}
    assert_ruby_status([env, "-e;"])
  end

  def test_null_script
    omit "#{IO::NULL} is not a character device" unless File.chardev?(IO::NULL)
    assert_in_out_err([IO::NULL], success: true)
  end

  def test_free_at_exit_env_var
    env = {"RUBY_FREE_AT_EXIT"=>"1"}
    assert_ruby_status([env, "-e;"])
    assert_in_out_err([env, "-W"], "", [], /Free at exit is experimental and may be unstable/)
  end

  def test_toplevel_ruby
    assert_instance_of Module, ::Ruby
  end

  def test_ruby_patchlevel
    # We stopped bumping RUBY_PATCHLEVEL at Ruby 4.0.0.
    # Released versions have RUBY_PATCHLEVEL 0, and un-released versions have -1.
    assert_include [-1, 0], RUBY_PATCHLEVEL
  end