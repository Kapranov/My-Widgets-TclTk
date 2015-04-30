#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

source [file join [file dirname [info script]] loadtable.tcl]

wm geometry . "830x400+20+230" 
wm overrideredirect . no 
wm resizable . 0 0
wm transient . 
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

array set table {
    rows	27 
    cols	4   
    table	.table
}

proc colorize num {
    if {$num>0 && $num%2} { return colored }
}

proc fill_headers {w {r 27} {c 4}} {
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


label .example -font {"utah mt" 13 {bold} } -text "IP адреса группы Администрация"

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
$t set   1,2 "010.002.061.061" \
	 1,3 "комната № 061" \
	 1,1 "Прынь Александр Витальевич" \
	 2,2 "010.005.002.001" \
	 2,3 "комната № 002" \
	 2,1 "Кариков Сергей Евгеньевич" \
	 3,2 "010.005.005.001" \
	 3,3 "комната № 005" \
	 3,1 "Лизогуб Ярослав Григорьевич" \
	 4,2 "010.005.006.001" \
	 4,3 "комната № 006" \
	 4,1 "Сидорова Елена Викторовна" \
	 5,2 "010.005.009.002" \
	 5,3 "комната № 009" \
	 5,1 "Бачурин Юрий Петрович" \
	 6,2 "010.005.015.001" \
	 6,3 "комната № 015" \
	 6,1 "Карчевский Николай Витальевич" \
	 7,2 "010.005.016.001" \
	 7,3 "комната № 016" \
	 7,1 "Корякин Роман Вячеславович" \
         8,2 "010.005.017.001" \
         8,3 "комната № 017" \
         8,1 "Серебряк Владимир Васильевич" \
         9,2 "010.005.018.001" \
         9,3 "комната № 018" \
         9,1 "Магкова Ирина Николаевна" \
        10,2 "010.005.020.001" \
        10,3 "комната № 020" \
        10,1 "Василенко Валерий Федорович" \
        11,2 "010.005.026.001" \
        11,3 "комната № 026" \
        11,1 "Пунько Ирина Ивановна" \
        12,2 "010.005.033.001" \
        12,3 "комната № 033" \
        12,1 "Бирюкова Татьяна Петровна" \
        13,2 "010.005.037.001" \
        13,3 "комната № 037" \
        13,1 "Богоявленский Валерий Александрович" \
        14,2 "010.005.037.003" \
        14,3 "комната № 037" \
        14,1 "Чобитько Сергей Петрович" \
        15,2 "010.005.038.001" \
        15,3 "комната № 038" \
        15,1 "Ким Вячеслав Русланович" \
        16,2 "010.005.039.001" \
        16,3 "комната № 039" \
        16,1 "Помников Игорь Иванович" \
        17,2 "010.005.041.001" \
        17,3 "комната № 041" \
        17,1 "Хаустов Игорь Викторович" \
        18,2 "010.005.042.001" \
        18,3 "комната № 042" \
        18,1 "Беденко Владимир Анатолиевич" \
        19,2 "010.005.044.001" \
        19,3 "комната № 044" \
        19,1 "Квасов Константин Иванович" \
        20,2 "010.005.046.001" \
        20,3 "комната № 046" \
        20,1 "Ткаченко Валерия Игоревна" \
        21,2 "010.030.001.001" \
        21,3 "комната № 001 (факт Эконом без)" \
        21,1 "Шкода Олег Алексеевич" \
        22,2 "010.030.001.002" \
        22,3 "комната № 001 (факт Эконом без)" \
        22,1 "Долгополов Станислав Васильевич" \
        23,2 "010.002.030.002" \
        23,3 "комната № 030" \
        23,1 "Проказа Роман Александрович" \
        24,2 "010.04.100.100" \
        24,3 "бассейн" \
        24,1 "Компаниец Юрий Анатольевич" \
        25,2 "010.003.036.001" \
        25,3 "комната № 036" \
        25,1 "Сахань Наталья Владимировна" \
        26,2 "010.003.039.001" \
        26,3 "комната № 039" \
        26,1 "Низовая Леся Ивановна" \

scrollbar .tsy -command [list $t yview]
button .exit -font {"utah mt" 12 {bold} } -text "Выход" -command {exit}

grid .example -     -sticky ew
grid $t       .tsy   -sticky news
grid .exit - -sticky ew
grid columnconfig . 0 -weight 1
grid rowconfig . 1 -weight 1


puts [list Table is $table(table)]
