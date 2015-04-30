#!/usr/local/bin/wish8.4

set sig {{{Short Peep} {MSO5L16A}}
         {{Ta-Da} {MSO5L24AE}}
	 {{Drop} {MLO6L24C<GEC}}
	 {{Army Horn} {MSO4L16G>L8C.<L16G>L8C.<L16G>C<G>CEL8C<L16GG>C<G>CG>L8C}}}

proc time_tick {} {
  global dd c1 c2 tt at b0 b1 b3 b4
  set dd [expr {!$dd}]
  .b2 configure -fg [expr {$dd?$c1:$c2}]
  set t [clock format [clock seconds] -format {%H%M}]
  if {![string equal $t $tt]} {
    set tt $t
    foreach {b0 b1 b3 b4} [split $t {}] {}
    if {[string equal $at $tt]} {
      set r [catch {
	global sigstr
        set fh [open {/dev/speaker} w]
	puts $fh $sigstr
	close $fh
      } tcl_ok]
      if {$r} {
        tk_messageBox -title {ERROR} -message $tcl_ok
	# bell
      }
    }
  }
  after 700 time_tick
}

proc set_sig {d} {
  global sig sn b12 sigstr
  set l [llength $sig]
  set sn [expr {($sn+$d+$l)%$l}]
  foreach {b12 sigstr} [lindex $sig $sn] {}
}

proc set_at {nv nm d} {
  global $nv at b6 b7 b9 b10
  set $nv [expr {([set $nv]+$d+$nm)%$nm}]
  set at "$b6$b7$b9$b10"
}

proc set_a {d m} {
  set ln ".b$d"
  set vn "b$d"
  global $vn
  set $vn 0
  set m1 [expr {$m-1}]
  label $ln -textvariable $vn -padx 0 -pady 3 -bd 0
  bind $ln <Button-1> "set_at $vn $m  1"
  bind $ln <Button-3> "set_at $vn $m -1"
  return $ln
}

proc set_v {d i} {
  set ln ".b$d"
  set vn "b$d"
  global $vn
  set $vn $i
  label $ln -textvariable $vn -padx 0 -pady 3 -bd 0
  return $ln
}

proc set_c {d t} {
  set ln ".b$d"
  label $ln -text $t -padx 0 -pady 3 -bd 0
  if {[string equal $t {-}]} {
    $ln configure -fg [$ln cget -bg]
  }
  return $ln
}

bind . <q> {exit}
foreach i {{v 0 0} {v 1 0} {v 2 :} {v 3 0} {v 4 0} {c 5 -}
           {a 6 3} {a 7 10} {c 8 :} {a 9 6} {a 10 10} {c 11 -}} {
  foreach {f a b} $i {grid ["set_$f" $a $b] -column $a -row 0}
}
set sn -1
set_sig 1
grid [label .b12 -textvariable b12 -padx 0 -pady 3 -bd 0] -column 12 -row 0
bind .b12 <Button-1> "set_sig  1"
bind .b12 <Button-3> "set_sig -1"
set dd 0
set c1 [.b0 cget -bg]
set c2 [.b0 cget -fg]
set tt {}
set at {0000}
time_tick
