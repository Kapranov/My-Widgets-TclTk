#!/usr/local/bin/wish8.4

proc m_name {l c} {
  return "m_${l}_${c}"
}

proc m_touch {l c i} {
  .game itemconfigure [m_name $l $c] -image "img_$i"
}

proc m_touch_g {l c f} {
  global game_fill
  for {set i $c} {$i < [lindex $game_fill $l]} {incr i} {
    m_touch $l $i $f
  }
}

proc ev_enter {l c} {
  m_touch_g $l $c b
}

proc ev_leave {l c} {
  m_touch_g $l $c a
}

proc ev_click {l c} {
  global game_fill
  if {[lindex $game_fill $l] <= $c} return
  m_touch_g $l $c c
  set game_fill [lreplace $game_fill $l $l $c]
  set w [check_end 0]
  if {$w == 1} return
  one_step
  check_end 1
}

#######################################

proc rand_one {l} {
  return [lindex $l [expr {int(rand()*[llength $l])}]]
}

proc check_end {case} {
  global game_fill signal
  set signal 0
  set s 0
  foreach {i} $game_fill {incr s $i}
  if {$s != 0} {return 0}
  if {$case == 1} {
    .game create image 31 118 -tag face -anchor nw -image img_fr
  } else {
    .game create image 31 118 -tag face -anchor nw -image img_fg
  }
#  restore_game
  return 1
}

# �����. ������ ������� ����� � ����
# { {�_�����_����_��������� {�����_���������} } ... }
proc logic {} {
  global game_fill
  set ok [list]
  foreach {st} [list \
    [list 1 0 0] \
    [list 0 1 0] \
    [list 0 0 1] \
    [list 1 1 1] \
    [list 0 2 2] \
    [list 2 0 2] \
    [list 2 2 0] \
    [list 0 3 3] \
    [list 3 0 3] \
    [list 3 3 0] \
    [list 0 4 4] \
    [list 0 5 5] \
    [list 1 2 3] \
    [list 1 3 2] \
    [list 2 1 3] \
    [list 2 3 1] \
    [list 3 1 2] \
    [list 3 2 1] \
    [list 1 4 5] \
    [list 1 5 4] \
    [list 2 4 6] \
    [list 2 5 7] \
    [list 3 4 7] \
    [list 3 5 6]] {
    set c 0
    set cl [list]
    foreach {i} {0 1 2} {
      set ai [lindex $st $i]
      set fi [lindex $game_fill $i]
      if {$ai < $fi} {
        lappend cl $i
      }
      if {$ai > $fi} {
        incr c
      }
    }
    if {$c == 0 && [llength $cl] == 1} {lappend ok [list [lindex $cl 0] $st]}
  }
  return $ok
}

proc alogic {} {
  global game_fill
  set non [list]
  foreach {i} {0 1 2} {
    if {[lindex $game_fill $i] > 0} { lappend non $i }
  }
  set l [rand_one $non]
  set v [expr {int(pow(rand(), .3)*([lindex $game_fill $l]))}]
  set ok [lreplace $game_fill $l $l $v]
  return [list $l $ok]
}

proc gen_step {} {
  set ok [logic]
  if {[llength $ok] > 0} {
    set step [rand_one $ok]
  } else {
    set step [alogic]
  }
  return $step
}

proc one_step {} {
  global game_fill
  set step [gen_step]
  set l [lindex $step 0]
  set new_fill [lindex $step 1]
  m_touch_g $l [lindex $new_fill $l] b
  update
  after 200
  m_touch_g $l [lindex $new_fill $l] a
  update
  after 200
  m_touch_g $l [lindex $new_fill $l] b
  update
  after 200
  m_touch_g $l [lindex $new_fill $l] c
  set game_fill $new_fill
}

#######################################

proc restore_game {} {
  global game_fill
  if {[llength [.game find withtag {face}]] > 0} {
    .game delete face
  }
  set game_fill [list 3 5 7]
  foreach {i} {0 1 2} {
    m_touch_g $i 0 a
  }
}

proc load_images {} {
  set image_data_a {
R0lGODlhEABkAOf2AFUlJVcmIVskIlwlImAjI2QmIWUnImslJGwmJTxAInMmImsrJnolIIEkI2cy
IoMmJE9BIxxcInMxIoslIx1dI4YoISVaIlNDICpYIBpiIDZVH5UmIpwkH5YnIxhoHgpxFpwkJZ0l
IAxyFwR4Ew9zGKUlJAd5FDpdIBF0GaEpIwB/D6gnIEtWJACAERN1GqkoIa8lIwKBEhJ7C5Y0IbIn
JRt3FLMoIAKIAEheI4U/JLklIklfJAWJACZ1E0tgH0pgJbsnJExhIEhkIQCOBU1iIb0pJACPB74q
H0llIk9jIgCQCc0kH0pmIyCBBsArIACRCwOSAMcpIwCVAACZAM8nIQeTAACXAcorHwKUEMkrJTR9
BACYAyWECwCZAAuUANglJQCZBQCaAEF5AtomH9IqI8wuIEV2Di+CCg6VAACbCAGcANMrJDR/FUZ3
D8M2HnpdFLw5IgWdAGFoI9wqIeMmJalEI+UnH15rJN0rIohZF+UoJd8sI+YpILFEIA2fAOAuJOgr
Ie8nJBCgAOksIvApJbVII/IqH8w+HeouIpZbFvMsINU+GoJpFvUtIWl4Du8yHvYvIuI6IDWXCPcw
I8hKH6NfFkWTBfkyJPozHfozJUeUB/s1HptpIeBIG4Z3GTmiCPw/II18FliiEclzF8B3H/ldJ/xf
IftlIuF7Hup3IfxtJqKeGf50If15IqGuB/56I/97Jfx/Jf6AHKCzEP+BHf6AJu2KIv6GH5+5F/+H
IP+IIv+NJKLCEv6SJf+UHfyWHKnCFf+TJ/6XHabFGP+YH6fGGqLJG/+ZIKHNDKbLC6TKHafMDv2d
If+eIv+fI/+gJf6jJf2nG/+kJ/+qHv+rIP6uIP+vIv+wI/+1Gf60Jf+2G/65G/+6Hf+7H/2+IP+/
If/CJP/GF//HGf7KGv/LHP/NIP3PH//RIv3VJf/XGP7WJv/YGv7bG//dH//eIf7hIv/iI//jJf7n
FfzmJv/oGP/pGgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH+FUNyZWF0ZWQgd2l0aCBU
aGUgR0lNUAAh+QQBCgD/ACwAAAAAEABkAAAI/gDVbJki5YwjU5lGiakCRo1DgVO8aFmU6dIkRYTy
gGnoMGKTSJsqQlKE6M8bNA+lfOq0aZNFjHzwLGHEsUooUC4vjRyEhwoQOD0ceqmUqeLFQHTIAFkB
goUMNZpOXdIJ88uRFxsq1DGhpk2mSSMJ8YwCo8MDBhIyDDFzSZFbRD1pcHig4IADCzw0lXpLZ82R
FBUUGCCQA2+VRIQQxcxiY0ODAwQGaLBwo4qnR3z+rAFSYoKCAgEWYPCgxIukQzGv6Ajx4MAAABAs
jFAzpQoXN2PKUOozw3UCCxRa0PaihA0pW9uepSp0wYIFFQ4HVsEC7FxyWapwRIjxcCAaL8PU/nWL
povVjhp+ukf0Uizdt2m7YP1wkT76lIjtx2ULFsuHizgP0RaRMu2Yg80xtxCBQoACeqHMO+h488wu
QiwY4H1eJBNPOuFM0wsSJDDo3TIbdvhhiAEO5AUy8rDT4S9MoKjeivK0E041x8QoYkTI0GOjNTnK
2BGPPpIDpI4XEtmOkUEyiGGP7xjZDJIPPUlPlNZMKWSDUEpJ5ZArXunlllZiqaWTRJr5JZdiZrlm
mWOiGaaaZKYZZ5Jz3lmlnW7WmWefcnYJKJ6Cnklom4bu+WeiYBb6Jp+MsklnoIg+uqiljvqZKaWT
Htqpopt6qmejlWpaKqejSpoqnIOCeqqowK2S+qmsq0KK6auuzqpqrLtGyqqvtpqq66+3DhssqrwS
K2ytly7Lq4qhztjlNJFCe2U4z6aJ7TNrWvsjt1tCWyO2TabIY41Mdnuui9OUK+08HE7ji7pTaKiO
N9GcuOMUBJrTjTQUiiDiFlsow2E2x+hChMApEsxLhB7SEgTD3Tk8DjbP6BJLEB8w6BAYuHiD4y2w
+NCxx2rMgo00vdDCyg8ne+wKjrrA8nLMDIqyyi+6oMLJCTgzqMQdciThHM4BAQA7
}
  set image_data_b {
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
CykZFL0hD1lAocIBBxQdEAA7
}
  set image_data_c {
R0lGODlhEABkAOevAA9qGBZnHRJsGwF3EhBxDB1pGBpqIAR4Ex5qGRpuFBRzDwR/ARF0GRZ0ECJt
HAeAAhB6ChpxHwKBEgx7FxJ7CwqBBCRvHgCGCgWCFAKIAACHDCJ0GxZ9DgWJACB1Ixp5HxCDBxN+
GgmKAACOBQCQAACPBwSLEgCRAAyLAgCQCQCRCxmBHhaGDA+MBACSDQCVACF+JACWAAuNFQeTAACX
ARKNBhWIGwKUEACYAwCZAA6OFh6EIQuUAACZBQCaAB+FIg6VAACbCAGcACqCIACcChmQDBGWAgCd
DAWdAACeDgChAACiAAmeAB+NIRSYBACjAQOfEACkAxCZFhaZBg2fAAClBhqUHQegEgCmCBCgABOa
GByVHgCnCiSRJACoDRubCxabGSWSJQCtAB2cDQ+iFQWpDwCvARKjFhmjBACwAwCxBgqqERKqAACy
CB2lCQ6rExWrAAKzCyCgIBOmJSKhIQC5ABitABGtFAC0HQC6AAe0DhynHBWuFh+oHQy1EBevGBOw
JRC2EgC9GgC/HR2xGxS3FA64Iwm/DAHAHyatIxe4Fg7ADgDGGBq5FyqvJSO0Hxy7GQDJGwzCIhi8
JxbCExDDIwPLHxnDFRTEJBHLDBzEFxfFJia/Hx/FGBXMDwDVHSjAIRvHJxPOIxvOFCTIHB7PFhrQ
JirLIRHYIh3SJyTRGizMIhXZIyDTKSbTGwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH+FUNyZWF0ZWQgd2l0aCBU
aGUgR0lNUAAh+QQBCgD/ACwAAAAAEABkAAAI/gCF4IjxYsaJgzxi4OghpKHAGDxOtMiQQUQKHgsZ
NoSYQsMDChwwmLjRI4hGIS9OXICgIAGDEDq0EKFCxeEMFAsIAECwYYeWM1y4RKkpROUAAAEcwLDS
hxCeNGWUNBwBokGBAB66zDEESlAjMVGQCBlRoYEAC0PkPNp0itQiPVxqUj0Q4UMXR5VMqVKlSVGZ
mh0nfPhBx9ApVKj4+q15ooOEFU32gDKFWHFcITNqsLCxJVHeypTShBXCI4UJGVoAbVKF6pOnQ2mW
bJyRooiWN5JE7WWkCA5Rji7GvBEUSVWmRWmwEB0448aXNY00RdJUB6zDgUB4GOGiaNGlQ3r+/l6H
qN2NHkGH6ogm+hCiETJpFNXpPdphDPdX3uhRBFWqQyH38QAEEWWkoYcYXPhnH0QDciFGGmIo999D
QAyIxYNwDDXhQDzwEEQUcIiRIXsNcchDD1G8IaKG/5mIooojThjgiSmuSCKA5L1oo4zkGVFjjP/N
6COMLC7Y4ZA7Btnjj0VutCSRNwrJZJRPJmmkdlPyeGSWSm4JpZZYftllmFY66WWZOJ4J5JVIrmkm
mW6mCWeTcrZJp5Rissmlnnm+aSeVat5ZZZx4olkooYMKGiigczL6J5iPjhkpn4Ym6uiefmJap6aH
KtoopJxaCmqfm5La6aWmiippqIuOWmmra6umCiulcbqoqa2kuohGrjnuiiauv+Z4K4Mf8ipgsSuK
1SKDRNRYRn3j3dcsHHA8q2y0ODS7BhwJTigQDgtREUUZz974bbhRBEXnuT1QsUQUUShx7YQ99IAE
FUrQ5K239867778AByywtwEBADs=
}
  set image_data_copy {
R0lGODlhnAALAKU0AABmAABnAABoAABpAABqAABrAABsAABtAABuAABvAABwAABxAAByAABzAAB0
AAB1AAB2AAB3AAB4AAB5AAB6AAB7AAB8AAB9AAB+AAB/AACAAACBAACCAACDAACEAACFAACGAACH
AACIAACJAACKAACLAACMAACNAACOAACPAACQAACRAACSAACTAACUAACVAACWAACXAACYAACZAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEKAD8ALAAAAACcAAsAAAb+wJ9w
SCwaj8NTCdmBIYsr01HkfFqv2OtJaiSlssKXBykyAACFENgqcSADKyIHYZQlRMdJpXgIAAggQiAC
AAguPzEOAAEXQgNnAChGIQAcRmYkPzIIACM/EA9HC3tgKAFHJYwtLh9jMR8dhz8jKCSxs1wuHT8g
KyAkJpk/KxxKJz8BKR8fMT8OAxp4SQQyQsQfLz8qBFVCISsvFgExMQEaLQhuGgMpIwFSAiPk1UUL
Awf0QwYDbisBAXhKLPkhhkOcUSQ4tBCiQUiMDT9qnejwwpILDy04kJDBIEKRFwUGEAhwzB6BkSs0
EBAyIcGPkAUutJkVIKQACcgIGBCQQMb+yAMTiEgI9SMDAAMFcP4g4MnICwAxQgwQQkLAjwQWhCyg
8EOABYVGXAQoASAOEQMSBMSogGAAHlA/UumkY3LkIQBh8FYQMGCBqbh/zFwo8KEIhgLNHCz4sQAf
4wflNg4oXMDjj5kIgsIggDMAxBUAXmw4YARBBoICAhFZkLUIRwY/NJD+4QJvgTE/IrgxYIAAANVD
MOBTEPQsBwIdCnBw+ykUAstaFVQjYAkvQb0Dmv0l+0VDAQOWiDwg+mHlVoZ0ICwQIaDabSEzBzRt
0Nls6NGXdqkYV8SB0iEyNGCAExwYIAQLeIEnBFxDVGAgEQUogEEDA+TzgwEdTDDSC8z+wSXAQFqR
kgAGP1j31A8VLBbRKSVY9YMIA0iAQD4yUODSDxbQ1QB8i6lQiGWEwedGARDJcEB9Qtw3GxGm/dBC
MvW0JgQMCRiQzQ8n8HfcDw1AoMkBpw3RwUpDmBAAAgkkEEBTQmDo444dhkIAREOMIsSIJWZzgl4q
bucijC7oREGKFKQQgH8BWLJAABBEAJAQnHzxUmGXuYGBABM0AACSeYoQgAWUshRKgANQMEGRTJ0V
QAUXXNBMAQhQIMBpJAQgQQMCtLCCAxZIsKp4sC24WARqYCjDB3HEGVsAEVQQlJ1XkVhAAhUUwKcQ
fgoB4w8wXLAAawuV0MACHlSzgASkESwQKgUPXsZFBw3JoMFWWP3AgCwLwCBDBQqQIsQJ1CDibQOe
pMANEQwooLAC2bigXkPeMOCAJC5IsAADHVgIAYgp7EiBJxOA+IkkG9D5AQMLNHQBpRWo0TEDIyz2
QSM/sLCjCkSh4GUW0A7BAgEQI+HCCCx0MNYaMiighhESSLnG01BHLfUaDdA8BAAHNPOECo8IcIGF
WKwgiREjdDP12WinHQQAOw==
}
  set image_data_e1 {
R0lGODlhGgAVAOf/AAFEAAJEAANFAABIAARGAABJAAVHAABKAQBLAgdIAABMAgFNAABOBApKAgNP
AABRAAtLAwFQBgVQAABTAA1MBANRBwBUAQBWAwdTCgRYAABbAABcAAZZAABdAABeAABfAQdbCQBg
AwJcEwVhAABkAApdCwBlABJZEQBmAABnABNaEgBoAA5fDgBqARFhDwJrAwBuAABvAABwABRjEQls
AAByABZkEwBzABhmFQN1AhBrGQB4AAV2BAB6ABtoFwB8AAF+ABdvHRlwHgaAAgCEABpxHwCFAACG
ABxyIACHAB10IgaJAACMASR2HACNAwCOAACQAACRAB58ISh5IAOSAACVACF+JACWAACXASt7IgCZ
ACSAJguUAACaAACbCAGcACaCJwWdACmEKQmeAACjAQCkAyyHLAClBgCmCBCgAACnCgCoDROhADCK
LymPMgWpDzKMMAqqES2TNg6rEzOUMBGtFDWWMhWuFjiYNDCcNxevGDGdOBqwGTKeOTycNx2xGzWh
Ox+yHD6dOSGzHj+fOjijPUCgOyO0H0GhPDqlPxi8Jye2Ihu9KCm4Ix2+KT+pQyu5JCC/Ki26JkKr
RS67JyTBLTC8KEStRzK9KSfCLinDL0ewSSvFMDfALUW1RizGMkqzSy7HM0a3SDDINDLJNTTKNjfM
OU6+TjnOOjrPO1DAUDfQRDzQPE7FTU/GTjvSRlTDU1DHTzzTR1bFVT7USVLJUD/VSlTLUlnIV0LX
S1XMU1PNW1TOXETZTVjOVVXPXUXaTlfQXkjcUErdUVPaT1XXXFrUYUvfUkzgU1bcUVjZXmDWXFfd
Ul3aWFnfU2TZX1zdYVvhVl3eYmDeW17fY13iV2bcYV7jWGfdYmPgXV/kWWDlWl3mYWbjYGPoXGHp
ZGTpXWLqZWPrZmjoa2frX2npbGXsZ2jsYGbtaGzrbmfvaW7ucWrybG/vcmzzbm30b272cHPzdXD3
cXj0cHH4cnL5c3r2cXP6dHX7dXr5e3b8dnv6fHf+d3j/eHn/eQAAACH+FUNyZWF0ZWQgd2l0aCBU
aGUgR0lNUAAh+QQBCgD/ACwAAAAAGgAVAAAIcwC/CBxIsKDBgwgTKlzIsKHDhxAjSpxI8YsMAhg5
VJHggEsOAj0uGsFI0kjBiwRHdiDQwSIBgSNNGrwoQ4bMiwiiuIRJQOZJAjVlriAw4MnOLzEPohw4
ckSBDUeTziSp0YGEKz0I8FgqtaLXr2DDih0LMSAAOw==
}
  set image_data_e2 {
R0lGODlhGgAVAOf/AAFEAAJEAANFAABIAARGAABJAAVHAABKAQBLAgdIAABMAgFNAABOBApKAgNP
AABRAAtLAwFQBgVQAABTAA1MBANRBwBUAQBWAwdTCgRYAABbAABcAAZZAABdAABeAABfAQdbCQBg
AwJcEwVhAABkAApdCwBlABJZEQBmAABnABNaEgBoAA5fDgBqARFhDwJrAwBuAABvAABwABRjEQls
AAByABZkEwBzABhmFQN1AhBrGQB4AAV2BAB6ABtoFwB8AAF+ABdvHRlwHgaAAgCEABpxHwCFAACG
ABxyIACHAB10IgaJAACMASR2HACNAwCOAACQAACRAB58ISh5IAOSAACVACF+JACWAACXASt7IgCZ
ACSAJguUAACaAACbCAGcACaCJwWdACmEKQmeAACjAQCkAyyHLAClBgCmCBCgAACnCgCoDROhADCK
LymPMgWpDzKMMAqqES2TNg6rEzOUMBGtFDWWMhWuFjiYNDCcNxevGDGdOBqwGTKeOTycNx2xGzWh
Ox+yHD6dOSGzHj+fOjijPUCgOyO0H0GhPDqlPxi8Jye2Ihu9KCm4Ix2+KT+pQyu5JCC/Ki26JkKr
RS67JyTBLTC8KEStRzK9KSfCLinDL0ewSSvFMDfALUW1RizGMkqzSy7HM0a3SDDINDLJNTTKNjfM
OU6+TjnOOjrPO1DAUDfQRDzQPE7FTU/GTjvSRlTDU1DHTzzTR1bFVT7USVLJUD/VSlTLUlnIV0LX
S1XMU1PNW1TOXETZTVjOVVXPXUXaTlfQXkjcUErdUVPaT1XXXFrUYUvfUkzgU1bcUVjZXmDWXFfd
Ul3aWFnfU2TZX1zdYVvhVl3eYmDeW17fY13iV2bcYV7jWGfdYmPgXV/kWWDlWl3mYWbjYGPoXGHp
ZGTpXWLqZWPrZmjoa2frX2npbGXsZ2jsYGbtaGzrbmfvaW7ucWrybG/vcmzzbm30b272cHPzdXD3
cXj0cHH4cnL5c3r2cXP6dHX7dXr5e3b8dnv6fHf+d3j/eHn/eQAAACH+FUNyZWF0ZWQgd2l0aCBU
aGUgR0lNUAAh+QQBCgD/ACwAAAAAGgAVAAAI9gC/CBxIsKDBgwgTKlzIsKHDhw3DSJwoUSDFi2EK
vlmkKFMnRZIULRopqVOmkygziSwjsIypbehiyjy3DabMmzGvKRrzRY2tPQSCIpnHAkS8SwQ2CSLw
K6jTVqZ4vhnWh4C/q/qCJZiCQIq/QgT06WvK6522nV+mVi0kqOy7pRjSfSWA790uAr6SSWKZlioB
tr/evXNDgIFcsO/c3Y1lim/fqlf96eNFwEwEJHPfofNFgDGbgT6BCp1XgsU8T0mXao5FwJWpzy1f
4kRHrprNmNVswdTJc+DGjh9DLvqzqGQnSYvmFF/keCDGil8oOodIvbr169YDAgA7
}
  set image_data_fg {
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
CwKkNzAmoFOUIxQQADs=
}
  set image_data_fr {
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
}
  set image_data_ng1 {
R0lGODlhHwAVAOf/AAFEAAJEAANFAABIAARGAABJAAVHAABKAQBLAgdIAABMAgFNAABOBApKAgNP
AABRAAtLAwFQBgVQAABTAA1MBANRBwBUAQBWAwdTCgRYAABbAABcAAZZAABdAABeAABfAQdbCQBg
AwJcEwVhAABkAApdCwBlABJZEQBmAABnABNaEgBoAA5fDgBqARFhDwJrAwBuAABvAABwABRjEQls
AAByABZkEwBzABhmFQN1AhBrGQB4AAV2BAB6ABtoFwB8AAF+ABdvHRlwHgaAAgCEABpxHwCFAACG
ABxyIACHAB10IgaJAACMASR2HACNAwCOAACQAACRAB58ISh5IAOSAACVACF+JACWAACXASt7IgCZ
ACSAJguUAACaAACbCAGcACaCJwWdACmEKQmeAACjAQCkAyyHLAClBgCmCBCgAACnCgCoDROhADCK
LymPMgWpDzKMMAqqES2TNg6rEzOUMBGtFDWWMhWuFjiYNDCcNxevGDGdOBqwGTKeOTycNx2xGzWh
Ox+yHD6dOSGzHj+fOjijPUCgOyO0H0GhPDqlPxi8Jye2Ihu9KCm4Ix2+KT+pQyu5JCC/Ki26JkKr
RS67JyTBLTC8KEStRzK9KSfCLinDL0ewSSvFMDfALUW1RizGMkqzSy7HM0a3SDDINDLJNTTKNjfM
OU6+TjnOOjrPO1DAUDfQRDzQPE7FTU/GTjvSRlTDU1DHTzzTR1bFVT7USVLJUD/VSlTLUlnIV0LX
S1XMU1PNW1TOXETZTVjOVVXPXUXaTlfQXkjcUErdUVPaT1XXXFrUYUvfUkzgU1bcUVjZXmDWXFfd
Ul3aWFnfU2TZX1zdYVvhVl3eYmDeW17fY13iV2bcYV7jWGfdYmPgXV/kWWDlWl3mYWbjYGPoXGHp
ZGTpXWLqZWPrZmjoa2frX2npbGXsZ2jsYGbtaGzrbmfvaW7ucWrybG/vcmzzbm30b272cHPzdXD3
cXj0cHH4cnL5c3r2cXP6dHX7dXr5e3b8dnv6fHf+d3j/eHn/eQAAACH+FUNyZWF0ZWQgd2l0aCBU
aGUgR0lNUAAh+QQBCgD/ACwAAAAAHwAVAAAI/gC/CBxIsKDBgwgTKlzIsGFBDh6ufOHQYyKHi0tk
jPhihIORLyNkKCRAoCIBkQRIGDHCpQYBKjQKvKBCoMbIDg6unPySciVHAkA40OAAhMDHhCc95NhJ
wMHFLzpTDIgyIAUBiUhlLHHAVORADgMsfLkwgMPCnSOYOuWw5IsMAiu+rCBAY6GRJ1+o3OW4kuWX
KEai/A3ssLDhw4gTF2TSYQCBCUygFjAqkEPJL09IuiVJwOzAK06jXEki+AfJFJUJiJ1LYPPBJED5
4sU5AoHEiw+AILC6WYaMowJhA5l4MgqBEG+HX+RRIGTrt76BQw2tU8aNzhwKeLBYpUOSt64PFjIm
OQGIhQsCabx8KhD8W5KeFcuXHxAAOw==
}
  set image_data_ng2 {
R0lGODlhHwAVAOf/AAFEAAJEAANFAABIAARGAABJAAVHAABKAQBLAgdIAABMAgFNAABOBApKAgNP
AABRAAtLAwFQBgVQAABTAA1MBANRBwBUAQBWAwdTCgRYAABbAABcAAZZAABdAABeAABfAQdbCQBg
AwJcEwVhAABkAApdCwBlABJZEQBmAABnABNaEgBoAA5fDgBqARFhDwJrAwBuAABvAABwABRjEQls
AAByABZkEwBzABhmFQN1AhBrGQB4AAV2BAB6ABtoFwB8AAF+ABdvHRlwHgaAAgCEABpxHwCFAACG
ABxyIACHAB10IgaJAACMASR2HACNAwCOAACQAACRAB58ISh5IAOSAACVACF+JACWAACXASt7IgCZ
ACSAJguUAACaAACbCAGcACaCJwWdACmEKQmeAACjAQCkAyyHLAClBgCmCBCgAACnCgCoDROhADCK
LymPMgWpDzKMMAqqES2TNg6rEzOUMBGtFDWWMhWuFjiYNDCcNxevGDGdOBqwGTKeOTycNx2xGzWh
Ox+yHD6dOSGzHj+fOjijPUCgOyO0H0GhPDqlPxi8Jye2Ihu9KCm4Ix2+KT+pQyu5JCC/Ki26JkKr
RS67JyTBLTC8KEStRzK9KSfCLinDL0ewSSvFMDfALUW1RizGMkqzSy7HM0a3SDDINDLJNTTKNjfM
OU6+TjnOOjrPO1DAUDfQRDzQPE7FTU/GTjvSRlTDU1DHTzzTR1bFVT7USVLJUD/VSlTLUlnIV0LX
S1XMU1PNW1TOXETZTVjOVVXPXUXaTlfQXkjcUErdUVPaT1XXXFrUYUvfUkzgU1bcUVjZXmDWXFfd
Ul3aWFnfU2TZX1zdYVvhVl3eYmDeW17fY13iV2bcYV7jWGfdYmPgXV/kWWDlWl3mYWbjYGPoXGHp
ZGTpXWLqZWPrZmjoa2frX2npbGXsZ2jsYGbtaGzrbmfvaW7ucWrybG/vcmzzbm30b272cHPzdXD3
cXj0cHH4cnL5c3r2cXP6dHX7dXr5e3b8dnv6fHf+d3j/eHn/eQAAACH+FUNyZWF0ZWQgd2l0aCBU
aGUgR0lNUAAh+QQBCgD/ACwAAAAAHwAVAAAI/gC/CBxIUKCXgggTfgnzRo+eOXMczvlD8Y/DhxEh
PiyTcA6ta9eGDdN2rZq2bSi1kRzGrGS1a8wysSkYRpK5IlLe4SviSV+RIkiKPOsDBt+vIr7wbclj
Cw3NTOgIENjkj4Cgqm2CBYv3iEA6QREEpSNQiBZHgmGgEpiiYh9ZrFr9PSMAq4igILAIxDI15mnU
QlY2vSUgAgkSf/ggyGGQjoKcBuYUhfFr9dmJwYX8afaHhIEPfzoYCNH2B2EYRVEF6RNjtWphJM/0
CSJAR58dAnhsvTG96JorZei6xZL2LpbxWN3MZYvVzFwz5ppmIiyjyJSpTKOsa19lSlMm66MU/mnq
PmdMmPNhDn7xwmbOoveL9MRZpEmTIvedNC1yX1+RpE6ZdHLfZGHMYcpI21xDiya2nIPOMAw6WA0t
w5iDjoXoZGgOLbu9QYsyTUCQwAzKWBiBXtegUwQBnrhDjVSySUVAEdXoEcYi3ZQQRDr7PJMOPqdI
5YZOSEDgg20QEODPbJrhU80cp8VCwCz+aJWOP1OAYEYF+OhjmAuzYNCGkoWQJcguxLwR5ZSckZVO
AluUCQtnSGwSgRhMllnImWnemOOO+Vg1yYxIRJAFnfM08QyTTCL25BcegthAAjbMYoMO77iDRwLp
GPYOOu/MFqNUNOqxkIEIbkMOOuTQsso2Jhmic84wmdCyKoYacjhQGRNRtIgk+73xqyT+zUHGfMQq
AqCAUAYEADs=
}
  foreach {nm} {a b c fr fg ng1 ng2 e1 e2 copy} {
    image create photo "img_$nm" -data [set "image_data_$nm"]
  }
}


proc create_field {} {
  pack [canvas .game -width 174 -height 380 -bd 0 -bg {#009900}]
  foreach {line} {0 1 2} {
    for {set m 0} {$m < 3+$line*2} {incr m} {
      set n [m_name $line $m]
      .game create image [expr {($m+2-$line)*22+10}] [expr {$line*110+30}] \
          -tag $n \
          -anchor nw \
          -image img_a
      .game bind $n <Enter>    [list ev_enter $line $m]
      .game bind $n <Leave>    [list ev_leave $line $m]
      .game bind $n <Button-1> [list ev_click $line $m]
    }
  }
  .game create image 2 2 \
          -tag new_game \
          -anchor nw \
          -image img_ng1 \
          -activeimage img_ng2
  .game bind new_game <Button-1> {restore_game}
  .game create image 172 2 \
          -tag exit \
          -anchor ne \
          -image img_e1 \
          -activeimage img_e2
  .game bind exit <Button-1> {exit}
  .game create image 9 365 \
          -anchor nw \
          -image img_copy
}

#######################################

load_images
set game_fill [list 3 5 7]
create_field
