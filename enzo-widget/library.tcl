#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

source [file join [file dirname [info script]] loadtable.tcl]

wm geometry . "830x400+120+328" 
wm overrideredirect . yes
wm resizable . 0 0
wm transient . 
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

array set table {
    rows	14 
    cols	4   
    table	.table
}

proc colorize num {
    if {$num>0 && $num%2} { return colored }
}

proc fill_headers {w {r 14} {c 4}} {
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

label .example -font {"utah mt" 13 {bold} } -text "IP адреса группы Библиотека"

set t $table(table)
table $t \
	-rows $table(rows) \
	-cols $table(cols) \
	-cache 1 \
	-titlerows 1 \
	-titlecols 1 \
	-yscrollcommand { .tsy set } \
	-width 1 -height 1 \
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

$t set  1,2 "010.006.001.003" \
	1,3 "Библиотека 1 этаж" \
	1,1 "Мищенко Елена Александровна" \
	2,2 "010.006.001.004" \
	2,3 "Библиотека 1 этаж" \
	2,1 "Мищенко Елена Александровна" \
	3,2 "010.006.002.001" \
	3,3 "Директор библиотеки" \
	3,1 "Денисенко Ольга Васильевна" \
	4,2 "010.006.003.001" \
	4,3 "Библиотека 3 этаж интернет зал" \
	4,1 "Денисенко Ольга Васильевна" \
	5,2 "010.006.003.002" \
	5,3 "Библиотека 3 этаж интернет зал" \
	5,1 "Денисенко Ольга Васильевна" \
	6,2 "010.006.003.003" \
	6,3 "Библиотека 3 этаж интернет зал" \
	6,1 "Денисенко Ольга Васильевна" \
	7,2 "010.006.003.004" \
	7,3 "Библиотека 3 этаж интернет зал" \
	7,1 "Денисенко Ольга Васильевна" \
	8,2 "010.006.003.005" \
	8,3 "Библиотека 3 этаж интернет зал" \
	8,1 "Денисенко Ольга Васильевна" \
	9,2 "010.006.003.006" \
	9,3 "Библиотека 3 этаж интернет зал" \
	9,1 "Денисенко Ольга Васильевна" \
	10,2 "010.006.003.007" \
	10,3 "Библиотека 3 этаж интернет зал" \
	10,1 "Денисенко Ольга Васильевна" \
	11,2 "010.006.003.008" \
	11,3 "Библиотека 3 этаж интернет зал" \
	11,1 "Денисенко Ольга Васильевна" \
	12,2 "010.006.003.009" \
	12,3 "Библиотека 3 этаж интернет зал" \
	12,1 "Денисенко Ольга Васильевна" \
	13,2 "010.006.003.010" \
	13,3 "Библиотека 3 этаж интернет зал" \
	13,1 "Денисенко Ольга Васильевна" \

scrollbar .tsy -command [list $t yview]
button .exit -font {"utah mt" 12 {bold} } -text "Выход" -command {exit}

grid .example -     -sticky ew
grid $t       .tsy   -sticky news
grid .exit - -sticky ew
grid columnconfig . 0 -weight 1
grid rowconfig . 1 -weight 1


puts [list Table is $table(table)]
