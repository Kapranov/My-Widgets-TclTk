#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

source [file join [file dirname [info script]] loadtable.tcl]

wm geometry . "830x400+70+263"
wm overrideredirect . yes
wm resizable . 0 0
wm transient . 
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

array set table {
    rows	20 
    cols	4   
    table	.table
}

proc colorize num {
    if {$num>0 && $num%2} { return colored }
}

proc fill_headers {w {r 20} {c 4}} {
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

label .example -font {"utah mt" 13 {bold} } -text "IP адреса группы Начальники курсов"

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
$t set  1,2 "010.010.004.001" \
	1,3 "комната № 104" \
	1,1 "Пастухов Валентин Владимирович" \
	2,2 "010.010.021.021" \
	2,3 "комната № 212" \
	2,1 "Никитюк Сергей Григорьевич" \
	3,2 "010.010.021.062" \
	3,3 "комната № 216" \
	3,1 "Кариков Сергей Евгеньевич" \
	4,2 "010.010.021.041" \
	4,3 "комната № 214" \
	4,1 "Гусев Дмитрий Анатолевич" \
	5,2 "010.010.021.082" \
	5,3 "комната № 218" \
	5,1 "Ткаченко Александр Александрович" \
	6,2 "010.010.022.001" \
	6,3 "комната № 000" \
	6,1 "Мельянцев Дмитрий Алесандрович" \
	7,2 "010.010.041.082" \
	7,3 "комната № 418" \
	7,1 "Черкасов Виталий Борисович" \
	8,2 "010.020.002.001" \
	8,3 "комната № 201" \
	8,1 "Пучков Игорь Евгеньевич" \
	9,2 "010.020.003.001" \
	9,3 "комната № 301" \
	9,1 "Иосифов Павел Александрович" \
	10,2 "010.020.036.002" \
	10,3 "комната № 000" \
	10,1 "Савенко Александр Александрович" \
	11,2 "010.020.021.072" \
	11,3 "комната № 217" \
	11,1 "Изотов Александр Сергеевич" \
	12,2 "010.020.004.002" \
	12,3 "комната № 000" \
	12,1 "Исаенко Александр Иванович" \
	13,2 "010.030.010.001" \
	13,3 "комната № 000" \
	13,1 "Заец Александр Михайлович" \
	14,2 "010.030.001.001" \
	14,3 "комната № 000" \
	14,1 "Шкода Олег Алексеевич" \
	15,2 "010.030.001.002" \
	15,3 "комната № 000" \
	15,1 "Долгополов Станислав Васильевич" \
	16,2 "010.030.025.005" \
	16,3 "комната № 505" \
	16,1 "Сиренко Александр Николаевич" \
	17,2 "010.030.031.021" \
	17,3 "комната № 312" \
	17,1 "Таранов Святослав Николаевич" \
	18,2 "010.030.051.021" \
	18,3 "комната № 512" \
	18,1 "Кириевский Олег Викторович" \
	19,2 "010.030.021.021" \
	19,3 "комната № 212" \
	19,1 "Халявкин Евгений Владимирович"

scrollbar .tsy -command [list $t yview]
button .exit -font {"utah mt" 12 {bold} } -text "Выход" -command {exit}

grid .example -     -sticky ew
grid $t       .tsy   -sticky news
grid .exit - -sticky ew
grid columnconfig . 0 -weight 1
grid rowconfig . 1 -weight 1


puts [list Table is $table(table)]
