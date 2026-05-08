do
          def include?(i)
            puts self.join(",")
            # Modify self to prove that we are operating on a copy.
            map! { i }
            puts self.join(",")
          end