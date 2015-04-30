#!/usr/bin/wish -f
label .x
set TRANSPARENT_GIF_COLOR [.x cget -bg]
image create photo x -file attention.gif 
.x config -image x
pack .x
