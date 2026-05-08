do |t|
        Tempfile.create do |f|
          $raise_on_dup = true
          t.times do
            RubyVM::InstructionSequence.new(f)
          rescue MyError
          else
            raise "MyError was not raised during RubyVM::InstructionSequence.new"
          end