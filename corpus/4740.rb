doesn't work on tmpfs.
      mount = `mount`
      mountpoints = []
      mount.scan(/ on (\S+) type (\S+) /) {
        mountpoints << [$1, $2]
      }
      mountpoints.sort_by {|mountpoint, fstype| mountpoint.length }.reverse_each {|mountpoint, fstype|
        if path == mountpoint
          fs = fstype
          break
        end