do |f|
      f.puts <<-INPUT
$:.unshift(File.expand_path('..', __FILE__)+'/./foo')
module Foo
  autoload :Bar, 'bar'
end