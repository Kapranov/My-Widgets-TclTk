#!/usr/local/bin/wish8.4

proc copy_attr {} {
  global input_file  \
         output_file
  array set inpatr [file attributes $input_file]
  array set outatr {}
  foreach {a} {-permissions
               -archive -hidden -readonly -system} {
    if {[info exists inpatr($a)]} {
      set outatr($a) $inpatr($a)
    }
  }
  if {[array size outatr] != 0} {
    eval [list file attributes $output_file] [array get outatr]
  }
}

proc do_trans {} {
  global input_file  \
         input_enc   \
         input_trans \
         output_file \
         output_enc  \
         output_trans
  set tcl_ok [catch {
    set i [open $input_file  r    ]
    set o [open $output_file w]
    fconfigure $i -encoding $input_enc  -translation $input_trans
    fconfigure $o -encoding $output_enc -translation $output_trans
    while {! [eof $i]} { puts -nonewline $o [read $i 10240] }
    close $o
    close $i
    copy_attr
  } err]
  if {$tcl_ok != 0} {
    return $err
  }
  return {}
}

#################### C L I

proc exit1 {} {
  puts {TCO v1.1
OPTIONS:
-if input_file
-ic input_charset
-ie input_eol
-of output_file
-oc output_charset
-oe output_eol
EOL VALUES: auto (default), lf, cr, crlf, binary
CHARSET VALUES: binary (default) or other
You can get full list of charsets by using -list option
Use -help to get help
}
  exit 1
}

proc exit2 {} {
  global reg_enc
  puts {Known charsets:}
  puts [join $reg_enc {, }]
  exit 0
}

proc test_param {} {
  global reg_eol     \
         reg_enc     \
         input_file  \
         input_enc   \
         input_trans \
         output_file \
         output_enc  \
         output_trans
  set flag 0
  if {[string equal $input_file {}]} {
    puts {Input file?}
    set flag 1
  }
  if {[string equal $output_file {}]} {
    puts {Output file?}
    set flag 1
  }
  if {[lsearch -exact $reg_eol $input_trans] == -1} {
    puts {Input EOL?}
    set flag 1
  }
  if {[lsearch -exact $reg_eol $output_trans] == -1} {
    puts {Output EOL?}
    set flag 1
  }
  if {[lsearch -exact $reg_enc $input_enc] == -1} {
    puts {Input charset?}
    set flag 1
  }
  if {[lsearch -exact $reg_enc $output_enc] == -1} {
    puts {Output charset?}
    set flag 1
  }
  return $flag
}

proc cmd_line {argv} {
  array set cmd {}
  foreach {o v d} {-if input_file   {}
                   -of output_file  {}
                   -ic input_enc    {}
		   -oc output_enc   {}
                   -ie input_trans  auto
		   -oe output_trans auto} {
    global $v
    set cmd($o) $v
    set $v $d
  }
  if {[llength $argv] == 1 && [string equal [lindex $argv 0] {-list}]} {
    return 2
  }
  if {[llength $argv] == 1 && [string equal [lindex $argv 0] {-?}]} {
    return 1
  }
  set var_name {}
  while {[llength $argv] != 0} {
    set o [lindex $argv 0]
    set argv [lreplace $argv 0 0]
    if {[string equal $var_name {}]} {
      if {[info exists cmd($o)]} {
        set var_name $cmd($o)
      } else {
        puts "Error option $o"
 	return 1
      }
    } else {
      set $var_name $o
      set var_name {}
    }
  }
  return 0
}

proc cli {argv} {
  set is [cmd_line $argv]
  if {$is == 0} {
    set f [test_param]
    if {$f == 1} {
      exit1
    }
    set f [do_trans]
    if {! [string equal $f {}]} {
      puts $f
      exit 1
    }
  } elseif {$is == 1} {
    exit1
  } else {
    exit2
  }
  exit 0
}

#################### G U I

proc process {} {
  global input_file   \
         input_enc    \
         input_trans  \
         output_file  \
         output_enc   \
         output_trans \
         menu_ie      \
         menu_it      \
         menu_oe      \
         menu_ot
  set input_file [tk_getOpenFile]
  if {[string equal $input_file {}]} { return }
  set output_file [tk_getSaveFile]
  if {[string equal $output_file {}]} { return }
  set input_enc    $menu_ie
  set input_trans  $menu_it
  set output_enc   $menu_oe
  set output_trans $menu_ot
  set f [do_trans]
  if {! [string equal $f {}]} {
    tk_messageBox -title {Error} -message $f
  }
}

proc prepare_window {} {
  global reg_eol reg_enc
  foreach {vid var lst} {bi it reg_eol
                         bo ot reg_eol
			 ci ie reg_enc
                         co oe reg_enc } {
    menubutton ".$vid" -textvariable "menu_$var" \
                       -menu ".$vid.m" \
		       -bd 2 \
		       -relief raised
    menu ".$vid.m" -tearoff 0
    set cnt 0
    foreach {i} [set $lst] {
      set cb 0
      if {$cnt != 0 && $cnt % 25 == 0} { set cb 1 }
      incr cnt
      .$vid.m add radiobutton -label $i \
                          -value $i \
			  -variable menu_$var \
			  -columnbreak $cb
    }
    .$vid.m invoke 0
  }
  grid [label .av -text {v 1.1} -foreground white] \
       [label .ai -text Input] \
       [label .ao -text Output -justify left] -sticky news
  grid [label .bh -text {End of line}] .bi .bo -sticky news
  grid [label .ch -text {Charset}]     .ci .co -sticky news
  grid [button .de -text {exit} -command {exit 0} \
         -activeforeground red -activebackground yellow ]\
       [button .dio -text {Select files & translate} -command {process}] - -sticky news
  grid [label .e -text {This utility has CLI interface too. Try -? option.}] - - -sticky news
}

proc gui {} {
  prepare_window
}

#################### M A I N

set reg_enc      [lsort -ascii [encoding names]]
set reg_eol      [list auto lf crlf cr binary]
set input_file   {}
set input_enc    {}
set input_trans  {}
set output_file  {}
set output_enc   {}
set output_trans {}
if {$argc != 0} { cli $argv } else { gui }

