do
      c = Class.new
      mixin = Module.new

      Module.new do
        refine c do
          include mixin
        end