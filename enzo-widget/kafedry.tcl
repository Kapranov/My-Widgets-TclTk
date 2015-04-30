#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

source [file join [file dirname [info script]] loadtable.tcl]

wm geometry . "830x400+120+296" 
wm overrideredirect . yes
wm resizable . 0 0
wm transient . 
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

array set table {
    rows	30 
    cols	4   
    table	.table
}

proc colorize num {
    if {$num>0 && $num%2} { return colored }
}

proc fill_headers {w {r 30} {c 4}} {
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

label .example -font {"utah mt" 13 {bold} } -text "IP адреса группы Кафедры"

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
	-roworigin 1 \
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

$t set  1,2 "010.001.003.001" \
	1,3 "комната № 003" \
	1,1 "Тертыченко Елена Васильевна" \
	2,2 "010.001.004.001" \
	2,3 "комната № 004" \
	2,1 "Коваленко Владимир Викторович" \
	3,2 "010.001.012.001" \
	3,3 "комната № 012" \
	3,1 "Могилевская Натэла Эдуардовна" \
	4,2 "010.001.013.001" \
	4,3 "комната № 013" \
	4,1 "Гекова Людмила Ивановна" \
	5,2 "010.001.017.001" \
	5,3 "комната № 017" \
	5,1 "Иванова Виктория Игоревна" \
	6,2 "010.001.019.001" \
	6,3 "комната № 019" \
	6,1 "Токайчук Ирина Викторовна" \
	7,2 "010.001.024.001" \
	7,3 "комната № 024" \
	7,1 "Бабичев Дмитрий Александрович" \
	8,2 "010.001.028.001" \
	8,3 "комната № 028" \
	8,1 "Фоменко Любовь Александровна" \
	9,2 "010.001.029.001" \
	9,3 "комната № 029" \
	9,1 "Иванова Виктория Игоревна" \
	10,2 "010.001.034.001" \
	10,3 "комната № 034" \
	10,1 "Черечукина Людмила Вячеславовна" \
	11,2 "010.001.040.001" \
	11,3 "комната № 401" \
	11,1 "Шабанова Лилия Валентиновна" \
	12,2 "010.002.030.051" \
	12,3 "комната № 305" \
	12,1 "Елисеева Яна Юрьевна" \
	13,2 "010.002.031.001" \
	13,3 "комната № 000" \
	13,1 "Старовойтова Юлия Геннадьевна" \
	14,2 "010.002.031.021" \
	14,3 "комната № 312" \
	14,1 "Анисов Николай Борисович" \
	15,2 "010.002.031.051" \
	15,3 "комната № 315" \
	15,1 "Елисеева Яна Юрьевна" \
	16,2 "010.002.040.031" \
	16,3 "комната № 403" \
	16,1 "Поклад Елена Вениаминовна" \
	17,2 "010.002.040.041" \
	17,3 "комната № 404" \
	17,1 "Лигус Елена Владимировна" \
	18,2 "010.002.040.091" \
	18,3 "комната № 409" \
	18,1 "Бондаренко Лариса Алексеевна" \
	19,2 "010.002.050.041" \
	19,3 "комната № 504" \
	19,1 "Лещенко Наталья Ивановна" \
	20,2 "010.002.050.091" \
	20,3 "комната № 509" \
	20,1 "Зуева Надежда Ивановна" \
	21,2 "010.004.026.011" \
	21,3 "комната № 261" \
	21,1 "Нурдинова Наталья Васильевна" \
	22,2 "010.004.026.001" \
	22,3 "комната № 000 " \
	22,1 "Швец Василина Сергеевна" \
	23,2 "010.004.025.041" \
	23,3 "комната № 254" \
	23,1 "Пикула Людмила Леонидовна" \
	24,2 "010.004.035.031" \
	24,3 "комната № 353" \
	24,1 "Поклад Василий Иванович" \
	25,2 "010.004.036.011" \
	25,3 "комната № 361" \
	25,1 "Гнатенко Евгений Александрович" \
	26,2 "010.004.036.012" \
	26,3 "комната № 361" \
	26,1 "Зеленцова Светлана Николаевна" \
	27,1 "Юдин Дмитрий Владимирович" \
	27,2 "010.004.055.041" \
	27,3 "комната № 554" \
	28,2 "010.002.060.041" \
	28,3 "комната № 604" \
	28,1 "Швец Яна Николаевна" \
	29,2 "010.002.060.091" \
	29,3 "комната № 609" \
	29,1 "Головин Анатолий Павлович" \
	30,2 "010.002.060.092" \
	30,3 "комната № 609" \
	30,1 "Нурдинова Наталья Васильевна" \

scrollbar .tsy -command [list $t yview]
button .exit -font {"utah mt" 12 {bold} } -text "Выход" -command {exit}

grid .example -     -sticky ew
grid $t       .tsy   -sticky news
grid .exit - -sticky ew
grid columnconfig . 0 -weight 1
grid rowconfig . 1 -weight 1


puts [list Table is $table(table)]
