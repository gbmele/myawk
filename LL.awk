###
BEGIN{
print "hi"
a[1,1]="o"
a[3,3]="p"
a[4,4]="x"
a[10,10]="l"
print_array(a,10,24)
print ""

}##end BEGIN
$1 == "days" {NUMDAYS = $2;  next}

$1 == "doc"  {print "doc stuff -- doc is " $2 " day is " $3 " request is " $4
              roster[$2 SUBSEP $3]=$4
              docs[$2]=$2
              next
}

$1 == "docs" {
       for (i=2;i<=NF;i++){
                docs[i-1]=$i
                print docs[i-1]          
       }
 
numdocs = NF-1
}

function print_array(array,rows,cols){
  for (i=1;i<=rows;i++){
     for(j=1;j<=cols;j++){
       if ((i,j) in array) 
         printf array[i,j]" "
       else printf "_ "
      }
    printf "\n"
  }
}
END{
printf "\n"
for (comb in roster) {
    split(comb,sep,SUBSEP)

    if((sep[1],sep[2]) in roster) 
       {print roster[sep[1],sep[2]] }
     else printf "_"
}

for (i=1;i<=numdocs;i++){
  printf docs[i]": "
  for(j=1;j<=NUMDAYS;j++){
     if ((docs[i]SUBSEP j) in roster)
            printf roster[docs[i] SUBSEP j]" "
     else printf "_ "
     if (j % 7 == 0) printf "| " 
  }
  printf "\n"
}


} #end END
