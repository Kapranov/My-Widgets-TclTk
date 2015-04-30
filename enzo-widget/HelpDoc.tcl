#!/usr/bin/env wish
#wm geometry . "+645+25"
#wm overrideredirect . yes

wm geometry . "276x690+649+20"
wm overrideredirect . no 
wm title . "Документация Tcl Python и Примеры программ на Tk"
wm resizable . 0 0
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 4 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

proc launch_01 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/dgHelpBrowser.kit &;}
proc launch_02 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/efftcl.kit &;}

proc launch_03 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tcl84dok.kit &;}
proc launch_04 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tcl83dok.kit &;}

proc launch_05 {} { exec mywikit &;}
proc launch_06 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/wikit.kit &;}

proc launch_07 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tcllib.kit &;}
proc launch_08 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/bw13dok.kit &;}

proc launch_09 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/mk4dok.kit &;}
proc launch_10 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/kitten.kit &;}

proc launch_11 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/critcl.kit &;}
proc launch_12 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/gbutton.kit &;}

proc launch_13 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/splash.kit &;}
proc launch_14 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/wikitool.kit &;}

proc launch_15 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/py22dok.kit &;}
proc launch_16 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/py15dok.kit &;}

proc launch_17 {} { exec /usr/src/tcltutor-linux-x86.bin &;}
proc launch_18 {} { exec gv -geometry "+1+20" \
     -antialias /home/kapranov/Documents/ebook/tcltk/Welch-Practical-programming-TclTk.pdf &;}

proc launch_19 {} { exec gv -geometry +3+100 -landscape \
    /home/kapranov/Documents/ebook/tcltk/TclTk-slide.ps &;}
proc launch_20 {} { exec xchm \
    /home/kapranov/Documents/ebook/tcltk/Welch-Practical-programming-TclTk.chm &;}

proc launch_21 {} { exec gv -geometry "630x280+2+150" -resize -antialias \
    /home/kapranov/Documents/ebook/tcltk/rtcl.pdf &;}
proc launch_22 {} { exec \
 gv -geometry "+1+20" \
     -antialias /home/kapranov/Documents/ebook/tcltk/TclTk-Toolkit.pdf &;}
     
proc launch_23 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tkcon.kit &;}
proc launch_24 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tclmath.kit &;}

proc launch_25 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tcldemo.kit &;}
proc launch_26 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/bwdemo.kit &;}

proc launch_27 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/widget.kit &;}
proc launch_28 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/slideshow.kit &;}

proc launch_29 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tcolor.kit &;}
proc launch_30 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/idict.kit &;}

proc launch_31 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/ml.kit &;}
proc launch_32 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/notebook2.1.3.kit &;}

proc launch_33 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tkcvs.kit &;}
proc launch_34 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tkdiff.kit &;}

proc launch_35 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/dgBlastParser.kit &;}
proc launch_36 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/dgTreePad.kit &;}

proc launch_37 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tempFile.kit &;}
proc launch_38 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tkinspect.kit &;}

proc launch_39 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tkoutline.kit &;}
proc launch_40 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/tkregexp.kit &;}

proc launch_41 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/ased.kit &;}
proc launch_42 {} { exec perl /home/kapranov/project/project-TclTk/wikikit/zinc-demos.pl &;}

proc launch_43 {} { exec vtcl &;}
proc launch_44 {} { exec tclkit \
    /home/kapranov/project/project-Tcltk/wikikit/Tkzinc-3.3.0.kit demo &;}

proc launch_45 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/brodie_sf.kit &;}
proc launch_46 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/dgSQLite3.kit &;}
proc launch_47 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/gorilla.kit &;}
proc launch_48 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/lua.tkd &;}
proc launch_49 {} { exec tclkit /home/kapranov/project/project-TclTk/wikikit/mk_manager.kit &;}
proc launch_50 {} { exec tclkit /home/kapranov/project-Tcltk/wikikit/newzpoint.kit &;}
proc launch_51 {} { exec tclkit /home/kapranov/project-Tcltk/wikikit/soarmap2.kit &;}
proc launch_51 {} { exec tixwish tixwidgets.tcl &;}


set font "-*-helvetica-*-r-*-*-*-*-*-*-*-*-*-r"

frame .app_help 
.app_help configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"help1"} {
    button .app_help.$a -font $font \
	-text "Документация Wiki Tcl/Tk и Python" -fg "white" -bg "DarkSlateGray" \
       	-relief groove -activebackground "DarkSlateGray" -activeforeground "white"
	pack .app_help.$a -fill x
	.app_help.$a flash
}
pack .app_help -fill x

frame .app_01
.app_01 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"dgHelpBrowser"} {
    button .app_01.$a -text $a -font $font -command launch_01 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_01.$a -side left
}
foreach b {"effect"} {
   button .app_01.$b -text "Effective Tcl/Tk" -font $font -command launch_02 \
 -width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
pack .app_01.$b -side left
}
pack .app_01

frame .app_02
.app_02 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tcl84"} {
    button .app_02.$a -text "TclTk 8.4 Manual" -font $font -command launch_03 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_02.$a -side left
}
foreach b {"tcl83"} {
    button .app_02.$b -text "TclTk 8.3 Manual" -font $font -command launch_04 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_02.$b -side left
}
pack .app_02

frame .app_03
.app_03 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"wiki1"} {
    button .app_03.$a -text "The Tcler's Wiki" -font $font -command launch_05 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_03.$a -side left
}
foreach b {"wiki2"} {
    button .app_03.$b -text "Own Wikit" -font $font -command launch_06\
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_03.$b -side left

}
pack .app_03

frame .app_04
.app_04 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tcllib"} {
    button .app_04.$a -text "Tcllib" -font $font -command launch_07 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_04.$a -side left
}
foreach b {"bw13dok"} {
    button .app_04.$b -text "BWidget Doc" -font $font -command launch_08 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_04.$b -side left
}
pack .app_04

frame .app_05
.app_05 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"mk4dok"} {
    button .app_05.$a -text "MetaKit Library" -font $font -command launch_09 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_05.$a -side left
}
foreach b {"kitten"} {
    button .app_05.$b -text "Kitten Tcl/Tk" -font $font -command launch_10 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_05.$b -side left

}
pack .app_05

frame .app_06
.app_06 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"critcl"} {
    button .app_06.$a -text "CriTcl" -font $font -command launch_11 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_06.$a -side left
}
foreach b {"gbutton"} {
    button .app_06.$b -text "Fancy gButton Tk" -font $font -command launch_12 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_06.$b -side left

}
pack .app_06

frame .app_07
.app_07 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"splash"} {
    button .app_07.$a -text "Splash Tcl/Tk" -font $font -command launch_13 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_07.$a -side left
}

foreach b {"wikitool"} {
    button .app_07.$b -text "Wikitool" -font $font -command launch_14 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_07.$b -side left

}
pack .app_07

frame .app_08
.app_08 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"py22dok"} {
    button .app_08.$a -text "Python 2.2.2" -font $font -command launch_15 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_08.$a -side left
}
foreach b {"py15dok"} {
    button .app_08.$b -text "Python 1.5.2" -font $font -command launch_16 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_08.$b -side left

}
pack .app_08

frame .app_09
.app_09 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tutorial"} {
    button .app_09.$a -text "Tcl/Tk Tutorial" -font $font -command launch_17 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_09.$a -side left
}
foreach b {"welch1"} {
    button .app_09.$b -text "Welch Tcl/Tk   pdf" -font $font -command launch_18 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
 	pack .app_09.$b -side left

}
pack .app_09

frame .app_10
.app_10 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tcltkslide"} {
    button .app_10.$a -text "Tcl/Tk Slide" -font $font -command launch_19 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_10.$a -side left
}
foreach b {"welch2"} {
    button .app_10.$b -text "Welch Tcl/Tk chm" -font $font -command launch_20 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_10.$b -side left

}
pack .app_10

frame .app_11
.app_11 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tcldatabase"} {
    button .app_11.$a -text "Database Tcl/Tk" -font $font -command launch_21 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_11.$a -side left
}
foreach b {"welch3"} {
    button .app_11.$b -text "Tcl/Tk Toolkit  pdf" -font $font -command launch_22 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_11.$b -side left

}
pack .app_11

frame .app_help2 
.app_help2 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"help2"} {
    button .app_help2.$a -font $font -text "Widgets Tcl/Tk и Python" \
	-fg "white" -bg "DarkSlateGray" -relief groove -activebackground "DarkSlateGray" \
	-activeforeground "white"
	pack .app_help2.$a -fill x
	.app_help2.$a flash
}
pack .app_help2 -fill x

frame .app_12
.app_12 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tkcon"} {
    button .app_12.$a -text "Tkcon" -font $font -command launch_23 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_12.$a -side left
}
foreach b {"tclmath"} {
    button .app_12.$b -text "TclMath" -font $font -command launch_24 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_12.$b -side left

}
pack .app_12

frame .app_13
.app_13 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tcldemo"} {
    button .app_13.$a -text "TclKit demo" -font $font -command launch_25 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_13.$a -side left
}
foreach b {"bwdemo"} {
    button .app_13.$b -text "BWidget demo" -font $font -command launch_26 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_13.$b -side left

}
pack .app_13

frame .app_14
.app_14 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"widget"} {
    button .app_14.$a -text "Tk Widget demo" -font $font -command launch_27 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_14.$a -side left
}
foreach b {"slideshow"} {
    button .app_14.$b -text "Widget SlideShow" -font $font -command launch_28 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_14.$b -side left

}
pack .app_14

frame .app_15
.app_15 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tcolor"} {
    button .app_15.$a -text "Color Editor" -font $font -command launch_29 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_15.$a -side left
}
foreach b {"idict"} {
    button .app_15.$b -text "Edict" -font $font -command launch_30 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_15.$b -side left

}
pack .app_15

frame .app_16
.app_16 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"ml"} {
    button .app_16.$a -text "ML Text Editor" -font $font -command launch_31 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_16.$a -side left
}
foreach b {"notebook"} {
    button .app_16.$b -text "Wiki Notebook" -font $font -command launch_32 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_16.$b -side left

}
pack .app_16

frame .app_17
.app_17 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tkcvs"} {
    button .app_17.$a -text "TkCVS" -font $font -command launch_33 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_17.$a -side left
}
foreach b {"tkdiff"} {
    button .app_17.$b -text "TKDiff" -font $font -command launch_34 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_17.$b -side left

}
pack .app_17

frame .app_18
.app_18 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"blastparser"} {
    button .app_18.$a -text "dgBlastParser" -font $font -command launch_35 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_18.$a -side left
}
foreach b {"treepad"} {
    button .app_18.$b -text "dgTreePad" -font $font -command launch_36 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_18.$b -side left

}
pack .app_18

frame .app_19
.app_19 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tempfile"} {
    button .app_19.$a -text "tempFile" -font $font -command launch_37 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_19.$a -side left
}
foreach b {"tkinspect"} {
    button .app_19.$b -text "Tkinspect" -font $font -command launch_38 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_19.$b -side left

}
pack .app_19

frame .app_20
.app_20 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tkoutline"} {
    button .app_20.$a -text "Tkoutline" -font $font -command launch_39 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_20.$a -side left
}
foreach b {"tkregexp"} {
    button .app_20.$b -text "Tkregexp" -font $font -command launch_40 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_20.$b -side left

}
pack .app_20

frame .app_21
.app_21 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"ased"} {
    button .app_21.$a -text "ased Tcl/Tk IDE" -font $font -command launch_41 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_21.$a -side left
}
foreach b {"zincerl"} {
    button .app_21.$b -text "TkZinc Perl" -font $font -command launch_42 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_21.$b -side left

}
pack .app_21

frame .app_22
.app_22 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"vtcl"} {
    button .app_22.$a -text "Visual Tcl IDE" -font $font -command launch_43 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_22.$a -side left
}
foreach b {"zincdemo"} {
    button .app_22.$b -text "TkZinc demo" -font $font -command launch_44 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_22.$b -side left

}
pack .app_22

frame .app_25 
.app_25 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"50"} {
    button .app_25.$a -font $font -text "Выход" -command {exit} \
	-fg "white" -bg "DarkSlateGray" -relief groove -activebackground "darkred" \
	-activeforeground "white"
	pack .app_25.$a -fill x 
	.app_25.$a flash
}
pack .app_25 -fill x
