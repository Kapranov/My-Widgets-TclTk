#!/usr/bin/wish
button .hello -text Hello -command {puts stdout "Hello, World!"} -bg red -fg yellow
.hello flash
pack .hello -padx 20 -pady 10
