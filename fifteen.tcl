#!/usr/local/bin/wish8.4

proc board_val {l c} {
  global board
  return [lindex [lindex $board $l] $c]
}

proc shuffle {} {
  global board board_l board_c board_sh board_active
  for {set i 0} {$i<100} {incr i} {
    for {set j 0} {$j<50} {incr j} {
      set dir [lindex {{0 1} {0 -1} {1 0} {-1 0}} [expr int(rand()*4)]]
      set l [expr $board_l+[lindex $dir 0]]
      set c [expr $board_c+[lindex $dir 1]]
      if {$l >= 0 && $l <= 3 && $c >= 0 && $c <= 3} { board_swap $l $c }
    }
    if {$board_sh == 1} {
      set_board
      update
    }
  }
  set_board
  set board_active 1
}

proc board_swap {l c} {
  global board board_l board_c
  lset board $board_l $board_c [board_val $l  $c]
  lset board $l $c {}
  set board_l $l
  set board_c $c
}

proc set_name {l c} {
  global board_win
  return "$board_win.set$l$c"
}

proc jump {l c} {
  global board_l board_c board board_init_state board_active
  if {$board_active == 0} {
    shuffle
  } else {
    foreach {dl dc} {0  1
                     0 -1
                     1  0
		    -1  0} {
      set ll [expr $l-$dl]
      set cc [expr $c-$dc]
      if {$ll == $board_l && $cc == $board_c} {
        board_swap $l $c
        set_board
      }
    }
    if {[string equal $board $board_init_state]} {
      tk_messageBox -message {Complete!} -title {Done!} -type ok
      set board_active 0
    }
  }
}

proc set_board {} {
  global board_win
  set lst {0 1 2 3}
  foreach l $lst {
    foreach c $lst {
      set n [set_name $l $c]
      set b [board_val $l $c]
      if {$b ne {}} {
        $n configure -text $b -relief raised -state normal
      } else {
        $n configure -text {} -relief flat -state disabled
      }
    }
  }
}

proc init_board {} {
  global board_win
  set lst {0 1 2 3}
  foreach l $lst {
    foreach c $lst {
      set n [set_name $l $c]
      button $n -text {} -command [list jump $l $c] -padx 4 -pady 4
      grid $n -row $l -column $c -sticky news
    }
  }
  grid columnconfigure $board_win $lst -uniform grc
  grid rowconfigure    $board_win $lst -uniform grr
}

proc init_menu {} {
  menu .m
  menu .m.m -tearoff 0
  .m.m add command -label {Shuffle} \
                   -underline 0 \
                   -accelerator {s} \
                   -command {shuffle}
  .m.m add checkbutton -label {Interactive shuffling mode} \
                   -underline 0 \
                   -accelerator {i} \
                   -variable board_sh
  .m.m add separator
  .m.m add command -label {About} \
                   -underline 0 \
                   -accelerator {a} \
                   -command {about}
  .m.m add separator
  .m.m add command -label {Quit} \
                   -underline 0 \
                   -accelerator {q} \
                   -command {exit}
  .m add cascade -label {15} -menu .m.m
  . config -menu .m
}

proc about {} {
  tk_messageBox -title {About} -message {Fifteen
v.1.0
Copyright (c) 2005 Michurin Alexey
This program is free software;\
you can redistribute it and/or\
modify it under the terms of\
the GNU General Public License.
This program is distributed in the\
hope that it will be useful, but\
WITHOUT ANY WARRANTY.}
}

proc init_frame {} {
  set f [frame .f -borderwidth 2 -relief sunken]
  pack $f
  return $f
}

set board_sh 1
set board_active 0
set board_win [init_frame]
set board_l 3
set board_c 3
set board_init_state \
 [list [list  1  2  3  4]\
       [list  5  6  7  8]\
       [list  9 10 11 12]\
       [list 13 14 15 {}]]
set board $board_init_state

init_menu
init_board
set_board

bind . <Key-q> {exit}
bind . <Key-a> {about}
bind . <Key-i> {set board_sh [expr 1-$board_sh]}
bind . <Key-s> {
  shuffle
}
