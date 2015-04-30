#!/bin/sh

# \
  if (test -z "$WISH"); then export WISH=wish; fi
# \
  exec "$WISH" "$0" -name wish ${1+"$@"}

package require led
wm geometry . "190x40+30+50" 
wm overrideredirect . yes
. config -bg "DarkSlateGray" -borderwidth 1 -relief raised -cursor "hand1" \
	-highlightthickness 1 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

namespace forget led::*
namespace import led::*

set img [image create photo blank -file binary.gif]

# ----------------------------------------------------------------------
set w .led
led $w -width 180 -height 10 -relief flat -bg red -fg magenta
pack $w -side top

#button $w.ll -text "call me: lugatex@yahoo.com" -bg green -fg black \
-relief groove -font {"utah mt" 10 {bold} }
#pack $w.ll 
led::after $w 1000 "led::flash $w 500 500"

label .vnv -text "\n\n\n\n\ВНИМАНИЕ !!!  сеть не работает\n\n\n\n" \
	    -font {"utah mt" 11 {bold} } -bg darkblue -fg white \
	    -relief flat
 pack .vnv -fill x
# ======================================================================
bind  all <Control-c> {destroy %W}
bell -displayof . -nice
