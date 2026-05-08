dout, @stderr, @wait_thread = Open3.popen3("cat") # hangs until we close our stdin side
          ObjectSpace.define_finalizer(self, self.class.make_finalizer(@stdin, @stdout, @stderr, @wait_thread))
        end