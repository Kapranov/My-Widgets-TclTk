package require Tk
#button .b -text "Hello!" -command {exit} -background red
#pack .b
#text .t -wrap word
#pack .t -fill both -expand 1
pack [canvas .c -background white]
.c create line 5 50 100 50 -fill red -width 3
.c create line 10 150 100 150 -fill blue -width 3
.c create text 100 10 -text Example
