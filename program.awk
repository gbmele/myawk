FNR==NR {shifts[$1]=$2
         start[$1] =$3
        }

END{
   print shifts["c"]
   print shifts["a"]
   print "code p is " shifts["p"] " starts at " start["p"]
   print "code a is " shifts["a"] " starts at " start["a"]

}