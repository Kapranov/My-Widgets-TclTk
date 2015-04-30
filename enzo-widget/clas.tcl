#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

source [file join [file dirname [info script]] loadtable.tcl]

wm geometry . "658x300+130+296" 
wm overrideredirect . yes
wm resizable . 0 0
wm transient . 
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

array set table {
    rows	17
    cols	4   
    table	.table
}

proc colorize num {
    if {$num>0 && $num%2} { return colored }
}

proc fill_headers {w {r 17} {c 4}} {
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

label .example -font {"utah mt" 13 {bold} } -text "IP адреса группы Учебные интернет классы"

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
$t set  1,2 "010.004.157.001" \
	1,3 "комната № 157" \
	1,1 "Дудолад Сергей Владимирович" \
	2,2 "010.004.157.002" \
	2,3 "комната № 157" \
	2,1 "Дудолад Сергей Владимирович" \
	3,2 "010.004.157.003" \
	3,3 "комната № 157" \
	3,1 "Дудолад Сергей Владимирович" \
	4,2 "010.004.157.004" \
	4,3 "комната № 157" \
	4,1 "Дудолад Сергей Владимирович" \
	5,2 "010.004.157.005" \
	5,3 "комната № 157" \
	5,1 "Дудолад Сергей Владимирович" \
	6,2 "010.004.157.006" \
	6,3 "комната № 157" \
	6,1 "Дудолад Сергей Владимирович" \
	7,2 "010.004.157.007" \
	7,3 "комната № 157" \
	7,1 "Дудолад Сергей Владимирович" \
	8,2 "010.004.157.008" \
	8,3 "комната № 157" \
	8,1 "Дудолад Сергей Владимирович" \
	9,2 "010.004.157.009" \
	9,3 "комната № 157" \
	9,1 "Дудолад Сергей Владимирович" \
	10,2 "010.004.157.010" \
	10,3 "комната № 157" \
	10,1 "Дудолад Сергей Владимирович" \
	11,2 "010.004.157.011" \
	11,3 "комната № 157" \
	11,1 "Дудолад Сергей Владимирович" \
	12,2 "010.004.157.012" \
	12,3 "комната № 157" \
	12,1 "Дудолад Сергей Владимирович" \
	13,2 "010.004.157.013" \
	13,3 "комната № 157" \
	13,1 "Дудолад Сергей Владимирович" \
	14,2 "010.004.157.014" \
	14,3 "комната № 157" \
	14,1 "Дудолад Сергей Владимирович" \
	15,2 "010.004.157.015" \
	15,3 "комната № 157" \
	15,1 "Дудолад Сергей Владимирович" \
	16,2 "010.004.157.016" \
	16,3 "комната № 157" \
	16,1 "Дудолад Сергей Владимирович"

scrollbar .tsy -command [list $t yview]
button .exit -font {"utah mt" 12 {bold} } -text "Выход" -command {exit}

grid .example -     -sticky ew
grid $t       .tsy   -sticky news
grid .exit - -sticky ew
grid columnconfig . 0 -weight 1
grid rowconfig . 1 -weight 1


puts [list Table is $table(table)]
