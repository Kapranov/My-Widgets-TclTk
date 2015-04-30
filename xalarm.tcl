#!/bin/sh
# the next line restarts using tclsh \
exec wish8.4 "$0" "$@" & exit

proc tick {} {
  global at
  set sec [clock seconds]
  set t [clock format $sec -format {%H:%M}]
  set s [clock format $sec -format {%S}]
  if {$s==0} {if {$t==$at} {bell}}
  .t.t configure -text "$t:$s"
  after 1000 tick
}

proc set_alarm_time {} {
  global at
  set h "[.b.h1 cget -text][.b.h2 cget -text]"
  if {$h>23} {
    set h {00}
    .b.h1 configure -text 0
    .b.h2 configure -text 0
  }
  set m "[.b.m1 cget -text][.b.m2 cget -text]"
  set at "$h:$m"
}

proc make_menubotton {p l} {
  menubutton $p -text [lindex $l 0] -menu $p.menu -bd 0 -padx 0 -pady 0
  pack $p -side left
  set m [menu $p.menu -tearoff 0]
  foreach i $l {
    $m add command -label $i -command "$p configure -text $i; set_alarm_time"
  }
}


pack [frame .t] -side top
pack [frame .b] -side bottom
pack [label .t.t -text {}]
make_menubotton .b.h1 {0 1 2}
make_menubotton .b.h2 {0 1 2 3 4 5 6 7 8 9}
pack [label .b.l2 -text {:} -bd 0 -padx 0 -pady 0] -side left
make_menubotton .b.m1 {0 1 2 3 4 5}
make_menubotton .b.m2 {0 1 2 3 4 5 6 7 8 9}

set_alarm_time
tick
