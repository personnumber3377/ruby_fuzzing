do
          autoload :Foo, autoload_path
          autoload :Bar, autoload_path

          t1 = Thread.new {Foo}
          t2 = Thread.new {Bar}

          t1.join
          GC.start # force GC.
          t2.join

          Object.send