#!/usr/bin/wish

proc close_tl {} {
    destroy .topl
}

proc call_tl {} {
    toplevel .topl
	button .topl.quitb -text Quit -command close_tl
	pack .topl.quitb -in .topl
}

button .callb -text Call -command call_tl
pack .callb
