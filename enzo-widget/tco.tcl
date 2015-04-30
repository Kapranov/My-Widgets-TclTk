#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

source [file join [file dirname [info script]] loadtable.tcl]

wm geometry . "658x280+75+263" 
wm overrideredirect . yes
wm resizable . 0 0
wm transient . 
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

array set table {
    rows	11 
    cols	4   
    table	.table
}

proc colorize num {
    if {$num>0 && $num%2} { return colored }
}

proc fill_headers {w {r 11} {c 4}} {
    for {set i 1} {$i < $r} {incr i} {
	$w set $i,0 "$i"
    }
    for {set j 1} {$j < $c} {incr j} {
	if {$j%3==1} {
	    $w set 0,$j "Фамилия"
	} elseif {$j%2==1} {
	    $w set 0,$j  "Комната"
	} elseif {$j} {
	    $w set 0,$j "IP адрес"
	}
    }
}

label .example -font {"utah mt" 13 {bold} } \
	  -text "IP адреса группы Информационно технического отдела"

set t $table(table)
table $t \
	-rows $table(rows) \
	-cols $table(cols) \
	-cache 1 \
	-titlerows 1 \
	-titlecols 1 \
	-yscrollcommand { .tsy set } \
	-width 2 -height 2 \
	-coltagcommand colorize \
	-flashmode on \
	-flashtime 10 \
	-selectmode browse \
	-colstretch unset \
	-rowstretch unset \
	-validate yes \
	-state normal \
	-wrap yes \
	-rowheight 1 \
	-justify left \
	-roworigin 0 \
	-colorigin 0 \
	-cursor "hand1" \
	-variable tab \
	-vcmd {if {![%W tag includes title %C]} { validate %c %S } }

fill_headers $t
$t tag config colored -bg lightblue -font {"utah mt" 11 {bold} }
$t tag config title -fg black -font {"utah mt" 12 {bold} }
$t tag config active -bg darkred -fg snow -relief solid
$t tag config title -fg white -bg black -font {"utah mt" 12 {bold} }
$t width 0 3
$t set  1,2 "010.001.010.001" \
	1,3 "комната № 10" \
	1,1 "Красновская И." \
	2,2 "010.001.020.001" \
	2,3 "комната № 020" \
	2,1 "Поролло Л.В." \
	3,2 "010.001.021.001" \
	3,3 "комната № 021" \
	3,1 "Тарабановский Д.Б." \
	4,2 "010.001.021.002" \
	4,3 "комната № 021" \
	4,1 "Портнягина О.П." \
	5,2 "010.001.021.003" \
	5,3 "комната № 021" \
	5,1 "Богатырев В.В." \
	6,2 "010.001.021.005" \
	6,3 "комната № 021" \
	6,1 "Мирошниченко Д. В." \
	7,1 "Антонов" \
	7,2 "" \
	7,3 "" \
	8,1 "Журков" \
	8,2 "" \
	8,3 "" \
	9,1 "Понамарев И.И." \
	9,2 "010.001.021.010" \
	9,3 "комната № 021" \
	10,1 "Test" \
	10,2 "010.100.100.100" \
	10,3 "для проверки сети"

scrollbar .tsy -command [list $t yview]
scrollbar .tsx -command [list $t xview] -orient horizontal
button .exit -font {"utah mt" 12 {bold} } -text "Выход" -command {exit}

grid .example -     -sticky ew
grid $t         -sticky news
grid .exit - -sticky ew
grid columnconfig . 0 -weight 1
grid rowconfig . 1 -weight 1


puts [list Table is $table(table)]
