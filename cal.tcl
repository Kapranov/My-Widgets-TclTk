package require Tk
pack [entry .e -textvar e -width 20]
bind .e <Return> {
    set e [regsub { *=.*} $e ""] ;
catch {expr [string map {/ *1./} $e]} res
    append e " = $res"
} 
