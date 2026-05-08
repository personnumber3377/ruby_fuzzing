do |tmp|
      Dir.chdir(tmp) do
        Dir.mkdir('x')
        File.open('x/t.rb', 'wb') {}
        File.open('x/a.rb', 'wb') {|f| f.puts("require_relative('t.rb')")}
        assert require('./x/t.rb')
        assert !require(File.expand_path('x/t.rb'))
        assert_nothing_raised(LoadError) {require('./x/a.rb')}
        assert_raise(LoadError) {require('x/t.rb')}
        File.unlink(*Dir.glob('x/*'))
        Dir.rmdir("#{tmp}/x")
        $:.replace(load_path)
        load_path = nil
        assert(!require('tmpdir'))
      end