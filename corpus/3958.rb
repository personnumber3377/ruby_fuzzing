do
  Thread.new do
    begin
      autoload :Foo, File.expand_path(__FILE__)
      Thread.pass
      Foo
    ensure
      Thread.pass
    end