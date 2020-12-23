#this is a bash script. To execute, use bash build.sh.

targets=($( cat pages.txt |awk '{print $1;}' |sed 's/[:;,]//g')) #targets is list of first words in pages.txt, minus ;:,
for i in "${!targets[@]}"; do
    line=($( cat pages.txt |sed -n $((i+1))p |sed 's/[:;,]//g')) #per target, get corresponding line
    target=$( echo $line |cut -d " " -f1) #the target is the first word from the line
    tdir=${target%/*}  #target directory is the part of this before the last /
    target=${target##*/}.WIP #while the target itself is the part after the last + .WIP /
    echo  > $target #create the empty target if it doesn't exist yet
    for j in "${line[@]}"; do
        if [ ${j##*/}.WIP != $target ]; #per word on the line, check if it's not the target file
        then
            cat $j >> $target #if it isn't, proceed by writing contents of the file to the target file
        fi
    done
done