global var1 var2 var3 var4 var5 
set var1 "" 
set var2 "" 
set var3 "" 
set var4 "" 
set var5 "" 
proc showValue {} {
	global var1 var2 var3 var4 var5 
	puts "Переменная var1 = $var1" 
	puts "Переменная var2 = $var2" 
	puts "Переменная var3 = $var3" 
	puts "Переменная var4 = $var4" 
	puts "Переменная var5 = $var5" 

	}
wm title . "Person Card" 
label .msg -font fixed -justify left -text "Test window." 
pack .msg -side top 
frame .buttons 
pack .buttons -side bottom -fill x -pady 2m 
button .buttons.dismiss -text "Вход" -command "exit"
button .buttons.code -text "Значения" -command "showValue" 
pack .buttons.dismiss .buttons.code -side left -expand 1 
foreach i {var1 var2 var3 var4 var5} { 
	frame .$i -bd 2 
	entry .$i.entry -relief sunken -width 40 -textvariable $i 
	label .$i.label 
	pack .$i.entry -side right 
	pack .$i.label -side left 
	}
.var1.label config -text Name: 
.var2.label config -text Address:
.var5.label config -text Phone: 
pack .msg .var1 .var2 .var3 .var4 .var5 -side top -fill x 
focus .var1.entry