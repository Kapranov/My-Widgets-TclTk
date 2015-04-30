#!/usr/local/bin/wish8.4

proc score_file_name {} {
  global env argv0
  if {[info exists env(HOME)]} {
    if {[regexp {^/} $env(HOME)]} {
      return [eval file join [file split $env(HOME)] .sapper]
    }
  }
  set v [lreplace [file split [file normalize argv0]] end end sapper.hsc]
  return [eval file join $v]
}

proc information {} {
  global score_file
  tk_messageBox -title {INFO} \
       -message "SCORE FILE:\n$score_file"
}

proc score_read {} {
  global score_file
  if {[file isfile $score_file]} {
    set tcl_ok [catch {
      set f [open $score_file r]
      gets $f tt
      set score_table [lsort -decreasing -integer -index 0 $tt]
      close $f
    } err]
    if {$tcl_ok == 0} {
      return $score_table
    } else {
      tk_messageBox -title {ERROR!} \
       -message "READ SCORE FILE:\n$score_file\nERROR:\n$err"
    }
  }
  return [list]
}

proc score_write {score_table} {
  global score_file
  set tcl_ok [catch {
    set f [open $score_file w]
    puts $f $score_table
    close $f
  } err]
  if {$tcl_ok != 0} {
    tk_messageBox -title {ERROR!} \
     -message "WRITE SCORE FILE:\n$score_file\nERROR:\n$err"
  }
}

proc name_ok {t} {
  return [expr {[string length $t] < 50 && [string is print $t]}]
}

proc reg_hi_score {} {
  global cnt_score score_name can_be_record
  if {! $can_be_record} return
  set can_be_record 0
  set score_table [score_read]
  if {[lindex [lindex $score_table end] 0] >= $cnt_score &&
      [llength $score_table] >= 20} { return }
  set top .top
  if {[winfo exists $top]} { return }
  toplevel $top
  grab $top
  grid [label $top.l -text {Enter your name:}] -sticky news
  grid [entry $top.e -textvariable score_name \
                     -validate all \
		     -validatecommand {name_ok %P}] -sticky news 
  grid [button $top.b -text {Ok} -command "destroy $top"] -sticky news
  bind $top.e <Key-Return> "destroy $top"
  tkwait visibility $top
  focus $top
  focus $top.e
  tkwait window $top
  lappend score_table [list $cnt_score $score_name]
  set score_table [lsort -decreasing -integer -index 0 $score_table]
  if {[llength $score_table] >= 21} {
    set score_table [lreplace $score_table 20 end]
  }
  score_write $score_table
  dispaly_table $score_table
}

proc dispaly_table {score_table} {
  set top .top
  if {[winfo exists $top]} { return }
  toplevel $top
  grab $top
  set n 0
  grid [label $top.t1 -text {Hi Score} -relief raised -padx 10 -pady 5] \
       - \
       -sticky news
  grid [label $top.t2 -text {score} -relief raised -padx 10 -pady 5] \
       [label $top.t3 -text {name}  -relief raised -padx 10 -pady 5] \
       -sticky news
  foreach i $score_table {
    grid [label $top.a$n -text [lindex $i 0] -anchor e] \
         [label $top.b$n -text [lindex $i 1] -anchor w] \
	 -sticky news
    incr n
  }
  grid [button $top.b -text {Ok} -command "destroy $top"] - -sticky news
  grid columnconfigure $top 0 -weight 1
  grid columnconfigure $top 1 -weight 2
  tkwait visibility $top
  focus $top
  focus $top.b
}

##########################################################

proc init_mines {t} {
  global cnt_mine init_mines game_field
  if {$init_mines == 0} { return }
  set init_mines 0
  set e {}
  foreach {k} [array names game_field] {
    set game_field($k) 0
    if {! [string equal $k $t]} {lappend e $k}
  }
  for {set i 0} {$i<$cnt_mine} {incr i} {
    set n [expr {int(rand()*[llength $e])}]
    set ee [lindex $e $n]
    set game_field($ee) 1
    set e [lreplace $e $n $n]
  }
}

proc init_level {} {
  global cnt_clear cnt_open cnt_mine cnt_flag game_field init_mines
  foreach {k} [array names game_field] {
    cell_touch $k img_empty img_empty_on
  }
  set total [llength [array names game_field]]
  set cnt_clear [expr {$total - $cnt_mine}]
  set cnt_open  0
  set cnt_flag  0
  set init_mines 1
}

proc next_level {} {
  global cnt_mine
  .score.nextlevel configure -state disabled
  incr cnt_mine 10
  init_level
}

proc close_level {} {
  global game_field
  foreach {k} [array names game_field] {
    if {$game_field($k) == 0} {
      cell_touch $k img_empty img_empty
    } elseif {$game_field($k) == 1} {
      cell_touch $k img_flag_e img_flag_e
    } elseif {$game_field($k) == 2 || $game_field($k) == 3 } {
    } elseif {$game_field($k) == 4} {
      cell_touch $k img_flag_no img_flag_no
    } elseif {$game_field($k) == 5} {
      cell_touch $k img_flag img_flag
    } else {
      tk_messageBox -title $game_field($k) -message $game_field($k)
      exit
    }
    set game_field($k) 2
  }
}

proc init_game {} {
  global cnt_mine cnt_score cnt_life can_be_record
  set cnt_mine  10
  set cnt_score 0
  set cnt_life  5
  set can_be_record 1
  init_level
}

##########################################################

proc pop_up_message {t m} {
  global pop_up
  if {$pop_up} {
    tk_messageBox -title $t -message $m
  }
}

proc cell_touch {t i j} {
  .game itemconfigure $t -image $i -activeimage $j
}

proc open_rec {t x y} {
  global game_field cnt_life cnt_open cnt_flag
  set dscore 0
  if {$game_field($t) == 0} {
    set nb [list]
    set nbc 0
    foreach {dx dy} {1  0  1 -1  0 -1
                    -1  0 -1  1  0  1} {
      set xx [expr {$x+$dx}]
      set yy [expr {$y+$dy}]
      set tt [cell_name $xx $yy]
      if {[info exists game_field($tt)]} {
        if {$game_field($tt)%2 == 1} {
          incr nbc
        } else {
          lappend nb $tt $xx $yy
        }
      }
    }
    incr cnt_open
    incr game_field($t) 2
    cell_touch $t "img_$nbc" "img_$nbc"
    if {$nbc == 0} {
      foreach {tt xx yy} $nb { incr dscore [open_rec $tt $xx $yy] }
    } else {
      incr dscore [expr {int(pow(2, ($nbc-1)))}]
    }
  } elseif {$game_field($t) == 1} {
    incr cnt_life -1
    cell_touch $t img_boom img_boom
    incr cnt_flag 1
    incr game_field($t) 2
    if {$cnt_life > 0} {
      pop_up_message {Lost!} {You have lost one life!}
    }
  }
  return $dscore
}

proc cell_open {t x y} {
  global cnt_life cnt_open cnt_clear cnt_score
  init_mines $t
  set d_score [open_rec $t $x $y]
  set d_life [expr {int(($cnt_score+$d_score)/250)-int(($cnt_score/250))}]
  incr cnt_score $d_score
  if {$d_life != 0} {
    pop_up_message {Bouns!} "Bonus!\n+$d_life life!"
    incr cnt_life $d_life
  }
  if {$cnt_clear == $cnt_open} {
    close_level
    .score.nextlevel configure -state normal
  }
  if {$cnt_life == 0} {
    close_level
    tk_messageBox -title {Game Over!} -message {Game Over!}
    reg_hi_score
  }
}

proc cell_flag {t x y} {
  global game_field cnt_flag
  if {$game_field($t) < 2} {
    cell_touch $t img_flag img_flag_on
    incr game_field($t) 4
    incr cnt_flag
  } elseif {$game_field($t) >= 4} {
    cell_touch $t img_empty img_empty_on
    incr game_field($t) -4
    incr cnt_flag -1
  }
}

##########################################################

proc load_images {} {
  set image_data_0 {
R0lGODlhFAAUAMYAAAAAABUeEhgjFR0qGR4rGSExHSMyHh1aCh9cDCBcDSBdDSFeDiNgECRhESVi
EidjFChlFSpnFyxoGSxqGS1qGkBdOC9sHDFtHjNvIDRwITdzJEdnPjh1JTl2JkxtQkJ+L0OAMFJ1
RkWBMkiENUiFNVZ7SkqGN0yIOU2JOk+LPFGNPlKPP1OPQFWRQlmVRlqWR1yYSV2ZSl6aS1+aTGCb
TWCcTWWgUmejVGmkVmqmV2unWGynWW2pWm6qW2+qXHCrXXWpZnKuX3SvYXisaXeyZHi0ZXm0ZXm1
Znu2aH60bXu3aIC2bn65a4G9boO8coW9c4S/cIXBcofAdYjBdYfCdIjDdYjDd4jEdYnEdonEd4rF
d4rGeYzHeY7Jeo3Od5DMfZDOfpTSgJvahpzch5/giqXnj6bpkKfqkanrkavtlLP1m8T+qsX+rMj+
rsr+scz+ssz+s8//tAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5
BAEKAH8ALAAAAAAUABQAAAf8gH+Cg4NuaoSIiX9vcW1maGmKiIxsZF9dYWNekYqUllygXEYTY2ec
gnBxlV+hoFQiCFCZZ2V/aGufXDpRoD8NCRIpXJhfG1ZioVgNJqBaSAxMSqFTBk5goTsHBz1cMg8J
KEKhTwTWrhYkEQ9BNUUMKsyg5OZcSiw7Hz9BWisLRa3zroEiYiEDFhgOOhx4AGJcOYEzHow4oMFG
Ey4XfAB8COoKlhckaGCIwSUHjo1JtnA5ouPDAQpEWskcIqBEiCUtPrhQ8AIChxNVWkkBQgDAHwAB
PCzJwg0LjxtaQA0tAMDoIKRKswgFQtVqIqxLp1aVRAhphQFjyX71migQADs=
}
  set image_data_1 {
R0lGODlhFAAUAKUsAAAAAAAAmRUeEhgjFR0qGR4rGSExHSMyHkBdOEdnPkxtQlJ1RlZ7SnWpZnis
aX60bYC2boO8coW9c4fAdYjBdYjDd4nEd4rGeYzHeY7JepDMfZDOfpTSgJvahpzch5/giqXnj6bp
kKfqkanrkavtlLP1m8T+qsX+rMj+rsr+scz+ssz+s8//tM//tM//tM//tM//tM//tM//tM//tM//
tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tCH5BAEKAD8ALAAAAAAUABQAAAaQwJ9w
OEyViMjkT8VChUYkJZJ5+mgyHI8oqqRaMWAMVssVrlhVTXgtzopAv5Hpy65jNYlKpx7o1zEUBxEb
bH2GdRIFg2uGjWyJi2GNh2uQhJKTAY+Kl5iUlZx8fogFDxd/qBgOAwwLEBapYRMNBQA/AAIKr6iz
BgC2Q7i6sLINvsBJwq+9v1JEuAgEzc7JyElBADs=
}
  set image_data_2 {
R0lGODlhFAAUAKUsAAAAABUeEhgjFR0qGR4rGSExHSMyHkBdOEdnPkxtQlJ1RlZ7SnWpZnisaX60
bYC2boO8coW9c4fAdYjBdYjDd4nEd4rGeYzHeY7JepDMfQBmZpDOfpTSgJvahpzch5/giqXnj6bp
kKfqkanrkavtlLP1m8T+qsX+rMj+rsr+scz+ssz+s8//tM//tM//tM//tM//tM//tM//tM//tM//
tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tCH5BAEKAD8ALAAAAAAUABQAAAaTwJ9w
OEyViMjkT8VChUYkJZJ5+mQwHI8oqqRaL+ALVssVrljVTHgtzopAv5Hpy65jMwhKp84PTwwQG2Ea
hGuEGmERBIFgh4UXjogXioyQjo2Xk4uCloeYnpqVnYaPoZx9dYoOFqh8DQILCg8VrWASDAQAPwAB
CbN9twUAukO8vrRhwcNSxrPKxFJCvAcDy9FJ1kpBADs=
}
  set image_data_3 {
R0lGODlhFAAUAKUsAAAAABUeEhgjFR0qGR4rGSExHSMyHkBdOEdnPkxtQlJ1RlZ7SnWpZnisaX60
bYC2boO8coW9c4fAdYjBdYjDd4nEd4rGeYzHeY7JepDMff//AJDOfpTSgJvahpzch5/giqXnj6bp
kKfqkanrkavtlLP1m8T+qsX+rMj+rsr+scz+ssz+s8//tM//tM//tM//tM//tM//tM//tM//tM//
tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tCH5BAEKAD8ALAAAAAAUABQAAAaXwJ9w
OEyViMjkT8VChUYkJZJ5+mQwHI8oqqRaL+ALVssVrljVDFjDDo9FoN/I9F2z225OBkHphO13f2AT
BhAbgnd4fxEEhoIXgY+Mjo+VYJOHgGGRl42ZiRqQiWGYgG2gpAQOFqahqGANAgsKDxWioZoXEgwE
AD8AAQm1lrsFAL5DwMK2YcXHUsq1zshSQsAHA8/VSdpKQQA7
}
  set image_data_4 {
R0lGODlhFAAUAKUtAAAAABUeEhgjFR0qGR4rGSExHSMyHpkA/0BdOEdnPkxtQlJ1RlZ7SnWpZnis
aX60bYC2boO8coW9c4fAdYjBdYjDd4nEd4rGeYzHeY7JepDMfZDOfpTSgJvahpzch5/giqXnj6bp
kKfqkanrkavtlLP1m8T+qsX+rMj+rsr+scz+ssz+s8//tP//////////////////////////////
/////////////////////////////////////////////yH5BAEKAD8ALAAAAAAUABQAAAaSwJ9w
OEyViMjkT8VChUYkJZJ5+mgyHI8oqqRaMWAMVssVrlhVTXgtzopAv5Hpe6iH6wcwVpOodO52YHhr
FAYRG4B5goFgEgSHbJFsjpCSlpSIlpKYiZ1hnIuKGIOfBA8XnqOMGA4CDAsQFpphEw0EAD8AAQqx
lrUFALhDuryytA3AwknEsb/BUkS6CAPP0MvKSUEAOw==
}
  set image_data_5 {
R0lGODlhFAAUAKUtAAAAABUeEhgjFR0qGR4rGSExHSMyHkBdOEdnPv8AikxtQlJ1RlZ7SnWpZnis
aX60bYC2boO8coW9c4fAdYjBdYjDd4nEd4rGeYzHeY7JepDMfZDOfpTSgJvahpzch5/giqXnj6bp
kKfqkanrkavtlLP1m8T+qsX+rMj+rsr+scz+ssz+s8//tP//////////////////////////////
/////////////////////////////////////////////yH5BAEKAD8ALAAAAAAUABQAAAaQwJ9w
OEyViMjkT8VChUYkJZJ5+mgyHI8oqqRaMWAMVssVrljVhDqsToxFoN/I9G2z12KOBlHp3BN/YRgU
BhEbgoiJGBIEhol2iYyOiJCIkoeUeJaNmIqKl4FglYsEDxehGKMOAgwLEBapmpATDQQAPwABCq+e
tAUAt0O5u7BhvsBSw6/HwVJCuQcDyM5J00pBADs=
}
  set image_data_6 {
R0lGODlhFAAUAKUsAAAAABUeEhgjFR0qGR4rGSExHSMyHkBdOEdnPkxtQlJ1RlZ7SnWpZnisaX60
bYC2boO8coW9c4fAdYjBdYjDd4nEd4rGeYzHeY7JepDMfZDOfpTSgJvahpzch5/giqXnj6bpkKfq
kanrkavtlLP1m8T+qsX+rMj+rsr+scz+ssz+s8//tP//////////////////////////////////
/////////////////////////////////////////////yH5BAEKAD8ALAAAAAAUABQAAAaRwJ9w
OESRiMjkL7U6gUQjJZJp8mQwm04oqqRaL+ALVssVqlbVTHgtzoY+P1HJA6iD64B7HZtBUDgXeHp5
gXYXEwYQGoWEgoxgEQSKbJRskZOVmZeLmZWbj6COn46khpEOFqGGjg0CCwoPFZ1hEgwEAD8AAQmx
mbUFdUS6vLK0DMC4SsOxv8FSQ7oHA87PSNRJQQA7
}
  set image_data_b {
R0lGODlhFAAUAKUtAAAAABEZDxQdERgjFRkkFRwpGB0qGTZOLzxXNAAAAEBcN0VjO0hoPmOPVmWS
WGqZXGybXW+gYHChYXKkY3OlY3OmZHSnZHWpZnaqZnisZ3qvaXqwan20bIO8cYS+cofCdYzJeY3L
eo7Me4/Ne5HQfZjag6fwkKjykqv2lK35lq/7l6/8mLH+mf//////////////////////////////
/////////////////////////////////////////////yH5BAEKAD8ALAAAAAAUABQAAAaUwJ9w
OEyViMjkT8VChUYkJZJ5+mgyHI8oqqRaMWAMVssVrlhVDSbBbifGItBvZPqC3W0wVoOodMJ3eIAY
FAYRG4N4CYMSBIeJboMYjY+AioyOiJaCgJSaYYqLYZ6QnGCNDxeJkoAOAgwLEBagrBgTDQQAPwAB
CrJrkrcFALpDvL6zYcLEUseyy8VSQrwHA8zSSddKQQA7
}
  set image_data_c {
R0lGODlhFAAUAKUAAAAAABomFx8sGiU2ICY3ICs/JSxAJlN3SFyEUGKLVGmWWm6dX5bRg5nUhqDc
i6Lejafjkajkk6vnlqzolqzpl67ql6/rmrDsmrPtm7bvnrbwoLrzosL3qcP4q8f5r837tM78ttD8
t9H8t9P9utv+wur+0ur+1O3+1+7+2e/+2u/+2/H/3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEKAD8ALAAAAAAUABQAAAaBwJ9w
OESRiMjkL7U6gUQjJZJp8mQwm04oqqRaL+ALVssVqlbVTHgtzoY+P1Hpy65jMwgKp84PTwwQGn19
EQSBg3yFh4hsioKMa46QkYaPkxeFDhaXYA0CCwoPFZASDAQAPwABCaJ9pQUAqEOqrKNhr7FStKK4
slJCqgcDub9JxEpBADs=
}
  set image_data_e {
R0lGODlhFAAUAKUAAAAAABEZDxQdERgjFRkkFRwpGB0qGTZOLzxXNEBcN0VjO0hoPmOPVmWSWGqZ
XGybXW+gYHChYXKkY3OlY3OmZHSnZHWpZnaqZnisZ3qvaXqwan20bIO8cYS+cofCdYzJeY3Leo7M
e4/Ne5HQfZjag6fwkKjykqv2lK35lq/7l6/8mLH+mQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEKAD8ALAAAAAAUABQAAAaBwJ9w
OESRiMjkL7U6gUQjJZJp8mQwm04oqqRaL+ALVssVqlbVTHgtzoY+P1Hpy65jMwgKp84PTwwQGn19
EQSBg3yFh4hsioKMa46QkYaPkxeFDhaXYA0CCwoPFZASDAQAPwABCaJ9pQUAqEOqrKNhr7FStKK4
slJCqgcDub9JxEpBADs=
}
  set image_data_f {
R0lGODlhFAAUAKUtAAAAABEZDxQdERgjFRkkFRwpGB0qGTZOLzxXNP8AAEBcN0VjO0hoPmOPVmWS
WGqZXGybXW+gYHChYXKkY3OlY3OmZHSnZHWpZnaqZnisZ3qvaXqwan20bIO8cYS+cofCdYzJeY3L
eo7Me4/Ne5HQfZjag6fwkKjykqv2lK35lq/7l6/8mLH+mc//tM//tM//tM//tM//tM//tM//tM//
tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tCH5BAEKAD8ALAAAAAAUABQAAAaUwJ9w
OEyViMjkT8VChUYkJZJ5+mgyHI8oqqRaMWAMVssVrlhVDSbBbifGItBvZPqC3W0wVoOodMJ3eIAY
FAYRG4N4CYMSBIeJboMYjY+AioyOiJaCgJSaYYqLYZ6QnGCNDxeJkoAOAgwLEBagrBgTDQQAPwAB
CrJrkrcFALpDvL6zYcLEUseyy8VSQrwHA8zSSddKQQA7
}
  set image_data_fe {
R0lGODlhFAAUAKUtAAAAABEZDxQdERgjFRkkFRwpGB0qGTZOLzxXNP8AAEBcN0VjO0hoPmOPVmWS
WGqZXGybXW+gYHChYXKkY3OlY3OmZHSnZHWpZnaqZnisZ3qvaXqwan20bIO8cYS+cofCdYzJeY3L
eo7Me4/Ne5HQfZjag6fwkKjykqv2lK35lq/7l6/8mLH+mf//////////////////////////////
/////////////////////////////////////////////yH5BAEKAD8ALAAAAAAUABQAAAaWwJ9w
OEyViMjkT8VChUYkJZJ5+mgyHI8oqqRaMWAMVssVrlhVDSbBbifGItBvZPqCE+E1XszRICodeWt5
e2EUBhEbgoVsghIEiYthhWGPkYSTlBiWipiTjpCdn5l5nItujZUEDxeSgnkOAgwLEBajrxMNBAA/
AAEKtYOCuQUAvEO+wLZhxMZSybXNx1JCvgcDztRJ2UpBADs=
}
  set image_data_fnoa {
R0lGODlhFAAUAKUtAAAAABEZDxQdERgjFRkkFRwpGB0qGTZOLzxXNP8AAEBcN0VjO0hoPmOPVmWS
WGqZXGybXW+gYHChYXKkY3OlY3OmZHSnZHWpZnaqZnisZ3qvaXqwan20bIO8cYS+cofCdYzJeY3L
eo7Me4/Ne5HQfZjag6fwkKjykqv2lK35lq/7l6/8mLH+mf//////////////////////////////
/////////////////////////////////////////////yH5BAEKAD8ALAAAAAAUABQAAAaZwJ9w
OEyViMjkT8VChUYkJZJ5+mgyHI8oqqRaMWAMVssVrlinRAKjbq/VWtBvZLK22fc2VoOodMJ5b2ph
FAYRG2F4a4qJEgSHiYp3jY+IkW6RGI6Ql5OUnIBui2GblmCTnpoEDxeho4xgDgIMCxAWqadqEw0E
AD8AAQqDr7kFAL5DwAq2ibvGyEnKts7HUkTABwPVSQlS20pBADs=
}
  set image_data_fo {
R0lGODlhFAAUAKUtAAAAABomFx8sGiU2ICY3ICs/JSxAJv8AAFN3SFyEUGKLVGmWWm6dX5bRg5nU
hqDci6Lejafjkajkk6vnlqzolqzpl67ql6/rmrDsmrPtm7bvnrbwoLrzosL3qcP4q8f5r837tM78
ttD8t9H8t9P9utv+wur+0ur+1O3+1+7+2e/+2u/+2/H/3M//tM//tM//tM//tM//tM//tM//tM//
tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tM//tCH5BAEKAD8ALAAAAAAUABQAAAaUwJ9w
OEyViMjkT8VChUYkJZJ5+mgyHI8oqqRaMWAMVssVrlhVDebAbh/GItBvZPqC3W0wVpOodMJ3eIAY
FAYRG4N4B4MSBIeJboMYjY+AioyOiJaCgJSaYYqLYZ6QnGCNDxeJkoAOAgwLEBagrBgTDQQAPwAB
CrJrkrcFALpDvL6zYcLEUseyy8VSQrwIA8zSSddKQQA7
}
  foreach {nm fl} {empty    e
                   empty_on c
                   flag     f
                   flag_e   fe
                   flag_on  fo
                   flag_no  fnoa
                   boom     b
                   0        0
                   1        1
                   2        2
                   3        3
                   4        4
                   5        5
                   6        6} {
    image create photo "img_$nm" -data [set "image_data_$fl"]
  }
}

proc cell_name {x y} { return "cell-$x-$y" }

# ___ __________x
# \  /\  /\
#  \/ size \
#   \      /
#    \____/
#     \y
#   0 - чисто
#   1 - мина
#  +2 - открыто
#  +4 - флаг
proc fill_game_screen {gm_cnv} {
  global game_field_size game_field
  array set game_field [list]
  set s1 [expr {$game_field_size  -1}]
  set s2 [expr {$game_field_size*2-1}]
  for {set y 0} {$y < $s2} {incr y} {
    for {set x 0} {$x < $s2} {incr x} {
      if {$x + $y >= $s1 && $x + $y < $s2 + $s1 } {
        set t [cell_name $x $y]
        set game_field($t) 0
        set yy [expr {151+($y-$s1)*15}]
        set xx [expr {195+($y-$s1)*10+($x-$s1)*20}]
        $gm_cnv create image $xx $yy \
          -tag $t \
          -anchor center \
          -image img_empty \
          -activeimage img_empty_on
        $gm_cnv bind $t <Button-1> [list cell_open $t $x $y]
        $gm_cnv bind $t <Button-3> [list cell_flag $t $x $y]
      }
    }
  }
}

proc create_game_screen {} {
  set gm_cnv [canvas .game -width 390 -height 302 -bd 0]
  fill_game_screen $gm_cnv
  return $gm_cnv
}

proc create_score_screen {} {
  set sc_frm [frame .score]
  set sc [frame $sc_frm.s]
  pack $sc -side left
  grid [label $sc.a -bd 0 -text {clear/open:}] \
       [label $sc.b -bd 0 -textvariable {cnt_clear}] \
       [label $sc.c -bd 0 -text {/}] \
       [label $sc.d -bd 0 -textvariable {cnt_open}]
  grid [label $sc.i -bd 0 -text {mines/flags:}] \
       [label $sc.j -bd 0 -textvariable {cnt_mine}] \
       [label $sc.k -bd 0 -text {/}] \
       [label $sc.l -bd 0 -textvariable {cnt_flag}]
  grid [label $sc.v -bd 0 -text {lifes:}] \
       [label $sc.w -bd 0 -textvariable {cnt_life}] x x
  grid [label $sc.x -bd 0 -text {score:}] \
       [label $sc.y -bd 0 -textvariable {cnt_score}] x x
  grid configure $sc.a $sc.i $sc.v $sc.x \
                 $sc.b $sc.j $sc.w $sc.y -sticky e
  grid configure $sc.d $sc.l -sticky w
  set l [label $sc_frm.logo -text {Sapper 0.9.9}]
  pack $l -side bottom -anchor se
  set b [button $sc_frm.nextlevel -text {Next Level} \
       -state disabled -command next_level]
  pack $b -side top -anchor se
  return $sc_frm
}

proc create_window {} {
  pack [create_game_screen] -side top
  pack [create_score_screen] -side bottom -fill both
  set m [menu [menu .mainmenu].game -tearoff 0]
  $m add command -label {New game} -command {init_game}
  $m add separator
  $m add command -label {Show hi score} -command {dispaly_table [score_read]}
  $m add separator
  $m add checkbutton -label {Suppress pop-up messages} \
         -variable pop_up -onvalue 0 -offvalue 1
  $m add separator
  $m add command -label {About} -command {about}
  $m add command -label {Info} -command {information}
  $m add separator
  $m add command -label {Exit} -command {exit}
  .mainmenu add cascade -label {Game} -menu $m
  . config -menu .mainmenu
  tkwait visibility .
  focus .
}

proc about {} {
  tk_messageBox -message {Copyright (c) 2005 Michurin Alexey
This program is free software;\
you can redistribute it and/or\
modify it under the terms of\
the GNU General Public License.
This program is distributed in the\
hope that it will be useful, but\
WITHOUT ANY WARRANTY.}
}

############################################################
# глобальные переменные:
# - счётчики
#  cnt_clear   - кол-во чистых полей (без мин)
#  cnt_flag    - кол-во флажков (включая взрывы)
#  cnt_life    - кол-во жизней
#  cnt_mine    - кол-во мин
#  cnt_open    - кол-во открытых полей (не считая неудачных попыток)
#  cnt_score   - очки
# - флаги
#  init_mines  - необходимо расставить мины
#  can_be_record - результат можно зарегистрировать
#  pop_up      - необходимо показывать pop-up-сообщения
# - данные
#  game_field  - поле
#  game_field_size - сторона поля
# - рекорды
#  score_file  - файл с рекордами
#  score_name  - имя рекордсмена (нужно только для ввода)

set game_field_size 10
bind . <Key-q> {exit}
set score_file [score_file_name]
load_images
create_window
init_game
