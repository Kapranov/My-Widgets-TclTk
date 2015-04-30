package require mysqltcl

set m [mysqlconnect -user root -db mysql]
mysqluse $m mysql
foreach res [mysqlsel $m {select host from user} -flatlist] {
    puts $res
}
mysqlclose $m
