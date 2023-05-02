SHIFTS_=1 ;   shifts_desc =$2;   shifts_start=$3 ;
DOCS_ =2  ;   docs_num =    $2;    docs_role =$3 ; docs_FTPT = $4;
ROSTER_ = 3

####FILENAME==ARGV[1] {  file2array[FNR] = $0 ; next }  THE WHOLE ARRAY

FILENAME==ARGV[SHIFTS_] { shifts[$1]=shifts_desc ; start[$1]=shifts_start}

FILENAME==ARGV[DOCS_]   {  nums[$1]=docs_num; role[$1]=docs_role ; FTPT[$1]=docs_FTPT }
FILENAME==ARGV[ROSTER_] {  roster_array[FNR]=$0}
#$ echo | awk '{print strftime("%d-%m-%y %H-%M-%S",systime());}'


END{
print "starting"
print start["a"]
print start["p"]
print start["c"]
#for (each in SHIFTS) {print each " " tolower(SHIFTS[each])}
#for (each in DOCS)  {print each " " DOCS[each]}
#for (each in ROSTER){print each " " ROSTER[each]}
for (each in doc){print doc[each]}
print "++"
docc = "ALINE[1]"
for (each_roster_line in roster_array) {
       
       count=split(roster_array[each_roster_line],ALINE)

       for (i =2;i<=count;++i) {
            print "day "i-1 " " ALINE[1]  "  " nums[ALINE[1]] " " role[ALINE[1]] " " ALINE[i] " " start[ALINE[i]]  " " shifts[ALINE[i]]
       }
}
assert_str(1==1,"1==1")

} #end of END
###functions at end

function assert_str(cond,str){
  if(!cond){
     print str " =======================================assert failed"
  }
}
function assert(cond){
  if(!cond){
     print str " =======================================assert failed"
  }
}
