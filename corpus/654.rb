do
        open("input.txt", "w") {|f| f.puts "BFI3CHL671"}
        cmd = "%WINDIR%/system32/find.exe \"BFI3CHL671\" input.txt > out.txt 2>err.txt"
        assert_equal(true, system(cmd), message)
        cmd = "\"%WINDIR%/system32/find.exe\" \"BFI3CHL671\" input.txt > out.txt 2>err.txt"
        assert_equal(true, system(cmd), message)
        cmd = "\"%WINDIR%/system32/find.exe BFI3CHL671\" input.txt > out.txt 2>err.txt"
        assert_equal(false, system(cmd), message)
      end