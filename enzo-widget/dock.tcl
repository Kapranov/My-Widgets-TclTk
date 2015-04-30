#!/usr/bin/env wish
wm geometry . "+740+23"
wm overrideredirect . yes
wm resizable . 0 0
wm transient .
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 4 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

proc launch_01 {} { exec enzo &;}
proc launch_02 {} { exec rcnetwork stop &;}
proc launch_03 {} { exec helix &;}
proc launch_04 {} { exec rcnetwork start &;}
proc launch_05 {} { exec sedna &;}
proc launch_06 {} { exec rcssh stop &;}
proc launch_07 {} { exec liga &;}
proc launch_08 {} { exec rcssh start &;}
proc launch_09 {} { exec axion &;}
proc launch_10 {} { exec rcsmb stop &;}
proc launch_11 {} { exec eris &;}
proc launch_12 {} { exec rcsmb start &;}
proc launch_13 {} { exec xvnc &;}
proc launch_14 {} { exec rcnmb stop &;}
proc launch_15 {} { exec xterm &;}
proc launch_16 {} { exec rcnmb start &;}
proc launch_17 {} { exec opera &;}
proc launch_18 {} { exec rcnamed stop &;}
proc launch_19 {} { exec yast &;}
proc launch_20 {} { exec rcnamed start &;}
proc launch_21 {} { exec webmin &;}
proc launch_22 {} { exec rcapache stop &;}
proc launch_23 {} { exec moodss &;}
proc launch_24 {} { exec rcapache start &;}
proc launch_25 {} { exec mysql &;}
proc launch_26 {} { exec rcmail stop &;}
proc launch_27 {} { exec ipsec &;}
proc launch_28 {} { exec rcmail start &;}
proc launch_29 {} { exec lsof &;}
proc launch_30 {} { exec rcdhcp stop &;}
proc launch_31 {} { exec fping &;}
proc launch_32 {} { exec rcdhcp start &;}
proc launch_33 {} { exec nmap &;}
proc launch_34 {} { exec rcSuSEfirefall stop &;}
proc launch_35 {} { exec tcpdump &;}
proc launch_36 {} { exec rcSuSEfirefall start &;}
proc launch_37 {} { exec iftop &;}
proc launch_38 {} { exec rcvsftpd stop &;}
proc launch_39 {} { exec iptraf &;}
proc launch_40 {} { exec rcvsftpd start &;}
proc launch_41 {} { exec ntop &;}
proc launch_42 {} { exec rcipt stop &;}
proc launch_43 {} { exec mrtg &;}
proc launch_44 {} { exec rcipt start &;}
proc launch_45 {} { exec wirshark &;}
proc launch_46 {} { exec iptlog &;}
proc launch_47 {} { exec tclog &;}
proc launch_48 {} { exec fwlog &;}

frame .app_01
.app_01 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"server enzo"} {
    button .app_01.$a -text $a -font {"utah mt" 12 {bold} } -command launch_01 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_01.$a -side left
}

foreach b {"rcnetwok stop"} {
    button .app_01.$b -text $b -font {"utah mt" 12 {bold} } -command launch_02 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_01.$b -side left

}
pack .app_01

frame .app_02
.app_02 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"server helix"} {
    button .app_02.$a -text $a -font {"utah mt" 12 {bold} } -command launch_03 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_02.$a -side left
}

foreach b {"rcnetwork start"} {
    button .app_02.$b -text $b -font {"utah mt" 12 {bold} } -command launch_04 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_02.$b -side left

}
pack .app_02

frame .app_03
.app_03 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"server sedna"} {
    button .app_03.$a -text $a -font {"utah mt" 12 {bold} } -command launch_05 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_03.$a -side left
}

foreach b {"rcssh stop"} {
    button .app_03.$b -text $b -font {"utah mt" 12 {bold} } -command launch_06 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_03.$b -side left

}
pack .app_03

frame .app_04
.app_04 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"server liga"} {
    button .app_04.$a -text $a -font {"utah mt" 12 {bold} } -command launch_07 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_04.$a -side left
}

foreach b {"rcssh start"} {
    button .app_04.$b -text $b -font {"utah mt" 12 {bold} } -command launch_08 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_04.$b -side left

}
pack .app_04

frame .app_05
.app_05 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"server axion"} {
    button .app_05.$a -text $a -font {"utah mt" 12 {bold} } -command launch_09 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_05.$a -side left
}

foreach b {"rcsmb stop"} {
    button .app_05.$b -text $b -font {"utah mt" 12 {bold} } -command launch_10 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_05.$b -side left

}
pack .app_05

frame .app_06
.app_06 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"server eris"} {
    button .app_06.$a -text $a -font {"utah mt" 12 {bold} } -command launch_11 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_06.$a -side left
}

foreach b {"rcsmb start"} {
    button .app_06.$b -text $b -font {"utah mt" 12 {bold} } -command launch_12 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_06.$b -side left

}
pack .app_06

frame .app_07
.app_07 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"xvnc"} {
    button .app_07.$a -text $a -font {"utah mt" 12 {bold} } -command launch_13 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_07.$a -side left
}

foreach b {"rcnmb stop"} {
    button .app_07.$b -text $b -font {"utah mt" 12 {bold} } -command launch_14 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_07.$b -side left

}
pack .app_07

frame .app_08
.app_08 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"xterm"} {
    button .app_08.$a -text $a -font {"utah mt" 12 {bold} } -command launch_15 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_08.$a -side left
}

foreach b {"rcnmb start"} {
    button .app_08.$b -text $b -font {"utah mt" 12 {bold} } -command launch_16 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_08.$b -side left

}
pack .app_08

frame .app_09
.app_09 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"opera"} {
    button .app_09.$a -text $a -font {"utah mt" 12 {bold} } -command launch_17 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_09.$a -side left
}

foreach b {"rcnamed stop"} {
    button .app_09.$b -text $b -font {"utah mt" 12 {bold} } -command launch_18 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_09.$b -side left

}
pack .app_09

frame .app_10
.app_10 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"yast"} {
    button .app_10.$a -text $a -font {"utah mt" 12 {bold} } -command launch_19 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_10.$a -side left
}

foreach b {"rcnamed start"} {
    button .app_10.$b -text $b -font {"utah mt" 12 {bold} } -command launch_20 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_10.$b -side left

}
pack .app_10

frame .app_11
.app_11 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"webmin"} {
    button .app_11.$a -text $a -font {"utah mt" 12 {bold} } -command launch_21 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_11.$a -side left
}

foreach b {"rcapache stop"} {
    button .app_11.$b -text $b -font {"utah mt" 12 {bold} } -command launch_22 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_11.$b -side left

}
pack .app_11

frame .app_12
.app_12 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"moodss"} {
    button .app_12.$a -text $a -font {"utah mt" 12 {bold} } -command launch_23 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_12.$a -side left
}

foreach b {"rcapache start"} {
    button .app_12.$b -text $b -font {"utah mt" 12 {bold} } -command launch_24 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_12.$b -side left

}
pack .app_12

frame .app_13
.app_13 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"mysql"} {
    button .app_13.$a -text $a -font {"utah mt" 12 {bold} } -command launch_25 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_13.$a -side left
}

foreach b {"rcmail stop"} {
    button .app_13.$b -text $b -font {"utah mt" 12 {bold} } -command launch_26 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_13.$b -side left

}
pack .app_13

frame .app_14
.app_14 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"ipsec"} {
    button .app_14.$a -text $a -font {"utah mt" 12 {bold} } -command launch_27 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_14.$a -side left
}

foreach b {"rcmail start"} {
    button .app_14.$b -text $b -font {"utah mt" 12 {bold} } -command launch_28 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_14.$b -side left

}
pack .app_14

frame .app_15
.app_15 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"lsof"} {
    button .app_15.$a -text $a -font {"utah mt" 12 {bold} } -command launch_29 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_15.$a -side left
}

foreach b {"rcdhcp stop"} {
    button .app_15.$b -text $b -font {"utah mt" 12 {bold} } -command launch_30 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_15.$b -side left

}
pack .app_15

frame .app_16
.app_16 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"fping"} {
    button .app_16.$a -text $a -font {"utah mt" 12 {bold} } -command launch_31 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_16.$a -side left
}

foreach b {"rcdhcp start"} {
    button .app_16.$b -text $b -font {"utah mt" 12 {bold} } -command launch_32 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_16.$b -side left

}
pack .app_16

frame .app_17
.app_17 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"nmap"} {
    button .app_17.$a -text $a -font {"utah mt" 12 {bold} } -command launch_33 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_17.$a -side left
}

foreach b {"susefirefall stop"} {
    button .app_17.$b -text $b -font {"utah mt" 12 {bold} } -command launch_34 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_17.$b -side left

}
pack .app_17

frame .app_18
.app_18 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tcpdump"} {
    button .app_18.$a -text $a -font {"utah mt" 12 {bold} } -command launch_35 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_18.$a -side left
}

foreach b {"susefirefall start"} {
    button .app_18.$b -text $b -font {"utah mt" 12 {bold} } -command launch_36 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_18.$b -side left

}
pack .app_18

frame .app_19
.app_19 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"iftop"} {
    button .app_19.$a -text $a -font {"utah mt" 12 {bold} } -command launch_37 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_19.$a -side left
}

foreach b {"rcvsftpd stop"} {
    button .app_19.$b -text $b -font {"utah mt" 12 {bold} } -command launch_38 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_19.$b -side left

}
pack .app_19

frame .app_20
.app_20 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"iptraf"} {
    button .app_20.$a -text $a -font {"utah mt" 12 {bold} } -command launch_39 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_20.$a -side left
}

foreach b {"rcvsftpd start"} {
    button .app_20.$b -text $b -font {"utah mt" 12 {bold} } -command launch_40 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_20.$b -side left

}
pack .app_20

frame .app_21
.app_21 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"ntop"} {
    button .app_21.$a -text $a -font {"utah mt" 12 {bold} } -command launch_41 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_21.$a -side left
}

foreach b {"rcipt stop"} {
    button .app_21.$b -text $b -font {"utah mt" 12 {bold} } -command launch_42 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_21.$b -side left

}
pack .app_21

frame .app_22
.app_22 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"mrtg"} {
    button .app_22.$a -text $a -font {"utah mt" 12 {bold} } -command launch_43 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_22.$a -side left
}

foreach b {"rcipt start"} {
    button .app_22.$b -text $b -font {"utah mt" 12 {bold} } -command launch_44 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_22.$b -side left

}
pack .app_22

frame .app_23
.app_23 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"wireshark"} {
    button .app_23.$a -text $a -font {"utah mt" 12 {bold} } -command launch_45 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_23.$a -side left
}

foreach b {"ipt log"} {
    button .app_23.$b -text $b -font {"utah mt" 12 {bold} } -command launch_46 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_23.$b -side left

}
pack .app_23

frame .app_24
.app_24 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"tc log"} {
    button .app_24.$a -text $a -font {"utah mt" 12 {bold} } -command launch_47 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_24.$a -side left
}

foreach b {"fw log"} {
    button .app_24.$b -text $b -font {"utah mt" 12 {bold} } -command launch_48 \
	-width 15 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_24.$b -side left
}
pack .app_24

frame .app_25 
.app_25 configure -background "DarkSlateGray" -cursor "hand1"
foreach a {"50"} {
    button .app_25.$a -font {"utah mt" 12 {bold} } -text "Выход" -command {exit} \
	-fg "white" -bg "darkred" -relief groove -activebackground "darkred" \
	-activeforeground "cyan"
	pack .app_25.$a -fill x
	.app_25.$a flash
}
pack .app_25 -fill x
