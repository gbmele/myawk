awk '
  function dt2epoch(date, time,      timestr) {
    timestr = "20" substr(date,1,2) " " substr(date,4,2) " " substr(date,7,2) \
               " " substr(time,1,2) " " substr(time,4,2) " " substr(time,7,2)
    return mktime(timestr)
  }
  function epoch2hms(t) {
    return strftime("%H:%M:%S", t, 1)
  }
  function abs(n) {return n<0 ? -1*n : n}
  NR == 1 {next}
  { print epoch2hms(abs(dt2epoch($5,$6) - dt2epoch($1,$2))) }
' file